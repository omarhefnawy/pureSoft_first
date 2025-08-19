import 'package:flutter/material.dart';
import 'package:fruits_task/core/config/appColors.dart';
import 'package:fruits_task/core/utils/widgets/button.dart';
import 'package:fruits_task/core/utils/widgets/custom_text.dart';
import 'package:gap/gap.dart';
import 'package:svg_flutter/svg_flutter.dart';
class OrderTracking extends StatelessWidget {
  const OrderTracking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(child: Icon(Icons.arrow_back_outlined),onTap: () {
          Navigator.pop(context);
        },),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: CustomText(text: "Order Tracking",size: 24,color: AppColors.primary,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: CustomText(text: "Your Order Code: #882610",size: 18,color: Color(0xff656565),)),
            CustomText(text: "3 items - 37.50 KD",size: 18,color: Color(0xff656565),),
            CustomText(text: "Payment Method : Cash",size: 18,color: Color(0xff656565),),
            Gap(50),
            Expanded(child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Stack(
                  children: [
                    Positioned(
                        child: SvgPicture.asset("assets/icons/Line2.svg"),
                      top: 0,
                      left: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.circle,color: Colors.black,),
                            Gap(10),
                            Expanded(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(text: "Delivered",size: 18,color: Colors.black,),
                                CustomText(text: "Estimated for 10 September, 2021 ",size: 18,color: Color(0xff656565),),
                              ],
                            )),
                          ],
                        ),
                        Gap(15),
                        Row(
                          children: [
                            Icon(Icons.circle,color: Colors.black,),
                            Gap(10),
                            Expanded(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(text: "Out for delivery",size: 18,color: Colors.black,),
                                CustomText(text: "Estimated for 10 September, 2021 ",size: 18,color: Color(0xff656565),),
                              ],
                            )),
                          ],
                        ),
                        Gap(15),
                        Row(
                          children: [
                            Icon(Icons.circle,color: Colors.green,),
                            Gap(10),
                            Expanded(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(text: "Order shipped",size: 18,color: Colors.black,),
                                CustomText(text: "Estimated for 10 September, 2021  ",size: 18,color: Color(0xff656565),),
                              ],
                            )),
                          ],
                        ),
                        Gap(15),
                        Row(
                          children: [
                            Icon(Icons.circle,color: Colors.green,),
                            Gap(10),
                            Expanded(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(text: "Confirmed",size: 18,color: Colors.black,),
                                CustomText(text: "Your order has been confirmed ",size: 18,color: Color(0xff656565),),
                              ],
                            )),
                          ],
                        ),
                        Gap(15),
                        Row(
                          children: [
                            Icon(Icons.circle,color: Colors.green,),
                            Gap(10),
                            Expanded(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(text: "Order Placed",size: 18,color: Colors.black,),
                                CustomText(text: "We have received your order ",size: 18,color: Color(0xff656565),),
                              ],
                            )),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

              ],
            )),
            Button(text: "Confirm", width: 350, height: 51, onTap: () {},),
            Gap(10),
            Button(text: "Cancel Order", width: 350, height: 51, onTap: () {},color: Color(0xffFF4A4A),),
          ],
        ),
      ),
    );
  }
}
