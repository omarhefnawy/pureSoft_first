import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruits_task/core/config/appColors.dart';
import 'package:fruits_task/core/config/app_responsive.dart';
import 'package:fruits_task/core/utils/widgets/custom_text.dart';
import 'package:fruits_task/models/sellerModel.dart';
import 'package:fruits_task/view/widgets/sellere_content.dart';
import 'package:gap/gap.dart';
import 'package:svg_flutter/svg_flutter.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  List<String> images=[
    "assets/category/fruit.png",
    "assets/category/caf.png",
    "assets/category/farmacy.png",
    "assets/category/farm.png",
    "assets/category/fruit.png",
    "assets/category/caf.png",
    "assets/category/farmacy.png",
    "assets/category/farm.png",
  ];
  List<SellerModel> sellers=[
    SellerModel(image: "assets/logo/logo.png", name: "Seller name", space: 1.5, opened: false,charge: 10.0,reviews: 4.5),
    SellerModel(image: "assets/logo/logo.png", name: "Seller name", space: 1.5, opened: true,charge: 10.0,reviews: 4.5),
    SellerModel(image: "assets/logo/logo.png", name: "Seller name", space: 1.5, opened: false,charge: 10.0,reviews: 4.5),
    SellerModel(image: "assets/logo/logo.png", name: "Seller name", space: 1.5, opened: true,charge: 10.0,reviews: 4.5),
    SellerModel(image: "assets/logo/logo.png", name: "Seller name", space: 1.5, opened: true,charge: 10.0,reviews: 4.5),
    SellerModel(image: "assets/logo/logo.png", name: "Seller name", space: 1.5, opened: false,charge: 10.0,reviews: 4.5),
  ];
  int _current=0;
  @override
  Widget build(BuildContext context) {
    double h = AppResponsive.bodyHeightWithBottomNav(context);
    double w = AppResponsive.width(context);
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          backgroundColor: AppColors.primary,
          type: BottomNavigationBarType.fixed,
          onTap: (value) => setState(() {
            _current=value;
          }),
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          currentIndex: _current,
          items: [
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.home),label: "Home"),
            BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.list),label: "Shopping"),
            BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.bagShopping),label: "Bag"),
            BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.heart),label: "Favourite"),
            BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.list),label: "List"),

        ],),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: 0.0,
        title: CustomText(text: "Fruit Market", color: AppColors.primary),
        actions: [
          Row(
            children: [
              SvgPicture.asset("assets/icons/search.svg"),
              Gap(10),
              SvgPicture.asset("assets/icons/setting.svg"),
              Gap(10),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Slider
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: h * .2,
                width: double.infinity,
                child: Image.asset("assets/home/carosal.png", fit: BoxFit.cover),
              ),
            ),

            Gap(20),
            //category
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(images.length, (index) {
                  String image= images[index];
                  return _buildCategory(image, h);
                },),
              ),
            ),
            Gap(5),
            //sellers
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Sellers",color: AppColors.primary,size: 16,),
                CustomText(text: "Show all",color:Colors.lightBlue,size: 18,),
              ],
            ),
            Gap(5),
            Expanded(child: ListView.builder(
              itemCount: sellers.length,
              itemBuilder: (context, index) {
              final data= sellers[index];
           return SellereContent(sellerModel: data);
            },)),
          ],
        ),
      ),

    );
  }
  _buildCategory(image,h){
    return Container(
      height: h*.15,
      child: Card(
        color: Colors.grey.shade200,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Image.asset(image),
        ),
      ),
    );
  }
}
