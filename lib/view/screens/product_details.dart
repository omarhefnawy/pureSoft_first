import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruits_task/core/config/appColors.dart';
import 'package:fruits_task/core/config/app_responsive.dart';
import 'package:fruits_task/core/utils/widgets/custom_text.dart';
import 'package:fruits_task/models/product_model.dart';
import 'package:gap/gap.dart';
import 'package:svg_flutter/svg_flutter.dart';

class ProductDetails extends StatefulWidget {
  final bool favourite;
  const ProductDetails({super.key,this.favourite=false});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  ProductModel model = ProductModel(
    name: "Product name",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit,sed do eiusmod tempor incididunt ut labore et doloremagna aliqua.",
    oldPrice: 14,
    newPrice: 12,
  );
  List<String> weight = [
    "50 Gram - 4.00 KD",
    "1 Kg - 6.25 KD",
    "2 Kg - 12.00 KD",
  ];
  List<String> adons = [
    "50 Gram - 4.00 KD",
    "1 Kg - 6.25 KD",
    "5 Kg - 6.25 KD",
    "0 Kg - 6.25 KD",
  ];
  TextEditingController weightController = TextEditingController();
  TextEditingController adonsController = TextEditingController();
  int _current = 0;
  bool adonsTapped = false;
  Set<String> selectedAdons = {};
  @override
  Widget build(BuildContext context) {
    double h = AppResponsive.bodyHeight(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {
        
      },child: Icon(FontAwesomeIcons.bagShopping,color: Colors.white,),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(FontAwesomeIcons.arrowLeft),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: CustomText(
          text: "Product Name",
          size: 24,
          color: AppColors.primary,
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.heart)),
              IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.lock)),
              Gap(3),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(h * .01),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/home/product.png",
                  height: h * .3,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Gap(h * .01),
              CustomText(
                text: "Category Name",
                color: AppColors.primary,
                size: 16,
              ),
              Gap(h * .01),
              Row(
                children: [
                  CustomText(text: model.name),
                  Spacer(),
                  Row(
                    children: [
                      CustomText(
                        text: " \$ ${model.oldPrice}",
                        size: 20,
                        color: Colors.red,
                      ),
                      Gap(5),
                      CustomText(text: " \$ ${model.newPrice}", size: 20),
                    ],
                  ),
                ],
              ),
              CustomText(
                text: model.description,
                color: Color(0xff656565),
                size: 14,
                max: 3,
              ),
              Gap(h * .02),
              PopupMenuButton<String>(
                itemBuilder: (context) {
                  return weight.map((item) {
                    return PopupMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList();
                },
                onSelected: (value) {
                  setState(() {
                    weightController.text = value;
                  });
                },
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'Select Weight',
                    border: OutlineInputBorder(),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        weightController.text.isEmpty
                            ? 'Select'
                            : weightController.text,
                      ),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
              Gap(h * .02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "Select Addons", size: 18),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        adonsTapped = !adonsTapped;
                      });
                    },
                    icon:
                        adonsTapped
                            ? Icon(Icons.arrow_circle_up_outlined)
                            : Icon(FontAwesomeIcons.arrowDown),
                  ),
                ],
              ),
              SvgPicture.asset("assets/icons/line.svg", color: Colors.black),
              adonsTapped
                  ? Column(
                    children: List.generate(adons.length, (index) {
                      bool isSelected = selectedAdons.contains(adons[index]);
                      return Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isSelected
                                    ? selectedAdons.remove(adons[index])
                                    : selectedAdons.add(adons[index]);
                              });
                            },
                            icon: Icon(
                              FontAwesomeIcons.circle,
                              color: isSelected ? Colors.blue : Colors.black,
                            ),
                          ),
                          CustomText(
                            text: adons[index],
                            size: 16,
                            color: Color(0xff656565),
                          ),
                        ],
                      );
                    }),
                  )
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
