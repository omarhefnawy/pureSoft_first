import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruits_task/core/config/appColors.dart';
import 'package:fruits_task/core/config/app_responsive.dart';
import 'package:fruits_task/core/utils/widgets/custom_text.dart';
import 'package:fruits_task/models/sellerModel.dart';
import 'package:fruits_task/view/screens/favourite_screen.dart';
import 'package:fruits_task/view/screens/orders_screen.dart';
import 'package:fruits_task/view/screens/product_checkout.dart';
import 'package:fruits_task/view/screens/setting_screen.dart';
import 'package:fruits_task/view/widgets/home_content.dart';
import 'package:fruits_task/view/widgets/sellere_content.dart';
import 'package:gap/gap.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:svg_flutter/svg_flutter.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  final List<Widget> _pages = [
    HomeContent(),
    OrdersScreen(),
    ProductCheckout(),
    FavouriteScreen(),
    SettingScreen(),
  ];
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    double h = AppResponsive.bodyHeightWithBottomNav(context);
    double w = AppResponsive.width(context);
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
        child: Container(
          height: h * .09,
          child: GNav(
            onTabChange: (value) {
              setState(() {
                _current = value;
              });
            },
            selectedIndex: _current,
            backgroundColor: AppColors.primary,
            rippleColor: Colors.black, // tab button ripple color when pressed
            hoverColor: Colors.white, // tab button hover color
            haptic: true, // haptic feedback
            curve: Curves.easeOutExpo, // tab animation curves
            duration: Duration(milliseconds: 900), // tab animation duration// the tab button gap between icon and text
            color: Colors.white, // unselected icon color
            activeColor: AppColors.primary, // selected icon and text color
            iconSize: 30, // tab button icon size
            tabBackgroundColor: Colors.white,// selected tab background color
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5,
            ), // navigation bar padding
            tabs: [
              GButton(icon: Icons.home,text: "Home",),
              GButton(icon: Icons.list,text: "Orders",),
              GButton(icon: Icons.shopping_bag,text: "Basket",),
              GButton(icon: Icons.favorite,text: "Favourite",),
              GButton(icon: Icons.person,text: "Settings",),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        leadingWidth: 0.0,
        title: CustomText(text: "Fruit Market", color: AppColors.primary),
        actions: [
          Row(
            children: [
              SvgPicture.asset("assets/icons/search.svg"),
              Gap(10),
              GestureDetector(
                onTap: () async {
                  final result = await showDialog(
                    context: context,
                    builder: (context) => FilterPopupDialog(),
                  );
                  // Navigator.pop(context, {"offers": offers, "freeDelivery": freeDelivery});
                  if (result != null) {
                    final freeDelivery=result["freeDelivery"]??false;
                    print(freeDelivery);
                  }
                },
                child: SvgPicture.asset("assets/icons/setting.svg"),
              ),
              Gap(10),
            ],
          ),
        ],
      ),
      body: _pages[_current],
    );
  }
}

class FilterPopup extends StatefulWidget {
  @override
  _FilterPopupState createState() => _FilterPopupState();
}

class _FilterPopupState extends State<FilterPopup> {
  bool offers = false;
  bool freeDelivery = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Filter by",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.location_on_outlined),
            title: Text("All Areas"),
            trailing: Icon(Icons.check),
          ),
          CheckboxListTile(
            title: Text("Offers"),
            value: offers,
            onChanged: (val) {
              setState(() {
                offers = val!;
              });
            },
          ),
          CheckboxListTile(
            title: Text("Free Delivery"),
            value: freeDelivery,
            onChanged: (val) {
              setState(() {
                freeDelivery = val!;
              });
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // هنا ممكن ترجع القيم المختارة
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
              backgroundColor: Colors.green[800],
            ),
            child: Text("Apply Filter"),
          ),
          SizedBox(height: 10),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Close"),
          ),
        ],
      ),
    );
  }
}

class FilterPopupDialog extends StatefulWidget {
  const FilterPopupDialog({super.key});

  @override
  State<FilterPopupDialog> createState() => _FilterPopupDialogState();
}

class _FilterPopupDialogState extends State<FilterPopupDialog> {
  bool offers = false;
  bool freeDelivery = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Filter by", style: TextStyle(fontWeight: FontWeight.bold)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.location_on_outlined),
            title: Text("All Areas"),
            trailing: Icon(Icons.check),
          ),
          CheckboxListTile(
            title: Text("Offers"),
            value: offers,
            onChanged: (val) {
              setState(() {
                offers = val!;
              });
            },
          ),
          CheckboxListTile(
            title: Text("Free Delivery"),
            value: freeDelivery,
            onChanged: (val) {
              setState(() {
                freeDelivery = val!;
              });
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Close"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context, {
              "offers": offers,
              "freeDelivery": freeDelivery,
            });
          },
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
          child: Text("Apply Filter", style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
