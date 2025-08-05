import 'package:fruits_task/core/config/app_responsive.dart';
import 'package:fruits_task/core/utils/widgets/custom_text.dart';
import 'package:fruits_task/models/sellerModel.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
class SellereContent extends StatefulWidget {
  final SellerModel sellerModel;
  const SellereContent({super.key,required this.sellerModel});

  @override
  State<SellereContent> createState() => _SellereContentState();
}

class _SellereContentState extends State<SellereContent> {
  @override
  Widget build(BuildContext context) {
    double h= AppResponsive.bodyHeightWithBottomNav(context);
    double w = AppResponsive.width(context);
    double cardHeight = h * 0.18;

    return Card(
      color: Colors.white,
      child: Container(
        height: cardHeight,
        child: Row(
          children: [
            SizedBox(
              height: cardHeight * 0.8,
              width: cardHeight * 0.8,
              child: ClipOval(
                child: Image.asset(widget.sellerModel.image, fit: BoxFit.cover),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.grey.shade200,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: widget.sellerModel.name,
                              size: w * 0.045,
                            ),
                            CustomText(
                              text: "${widget.sellerModel.reviews}",
                              size: w * 0.035,
                              color: Color(0xff656565),
                            ),
                          ],
                        ),
                        Gap(h * 0.01),
                        CustomText(
                          text: "Delivery Charges :  ${widget.sellerModel.charge}",
                          color: Color(0xff656565),
                          size: w * 0.035,
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: widget.sellerModel.opened ? "Opened" : "Closed",
                              size: w * 0.035,
                              color: Color(0xff00BB1A),
                            ),
                            CustomText(
                              text: "${widget.sellerModel.space} KM",
                              size: w * 0.035,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
