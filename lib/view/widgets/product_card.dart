import 'package:flutter/material.dart';
import 'package:fruits_task/core/config/app_responsive.dart';
import 'package:fruits_task/models/product_model.dart';
import 'package:gap/gap.dart';

import '../../core/utils/widgets/custom_text.dart';
class ProductCard extends StatefulWidget {
  final ProductModel product;
  final bool forFav;
   ProductCard({super.key,required this.product,this.forFav=false});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    double h = AppResponsive.bodyHeightWithBottomNav(context);
    double w = AppResponsive.width(context);
    double cardH = h * .7;
    return Card(
      color: Colors.grey.shade100,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(
                  "assets/home/product_img.png",
                ),
                radius: 35,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: Icon(Icons.delete),
                      ),
                      CustomText(text: widget.product.name, size: 10),
                      CustomText(text: widget.product.description, size: 10),
                      Row(
                        children: [
                          CustomText(
                            text: "\$${widget.product.oldPrice}",
                            size: 12,
                            color: Color(0xff656565),
                          ),
                          Spacer(),
                          CustomText(
                            text: "\$${widget.product.newPrice}",
                            size: 14,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
