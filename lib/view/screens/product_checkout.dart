import 'package:flutter/material.dart';
import 'package:fruits_task/core/config/appColors.dart';
import 'package:fruits_task/core/config/app_responsive.dart';
import 'package:fruits_task/core/utils/widgets/custom_text.dart';
import 'package:fruits_task/models/product_model.dart';
import 'package:fruits_task/view/screens/product_details.dart';
import 'package:fruits_task/view/widgets/product_card.dart';
import 'package:gap/gap.dart';

class ProductCheckout extends StatefulWidget {
  const ProductCheckout({super.key});

  @override
  State<ProductCheckout> createState() => _ProductCheckoutState();
}

class _ProductCheckoutState extends State<ProductCheckout> {
  List<ProductModel> products = [
    ProductModel(name: "Product name", description: "Product description", oldPrice: 14, newPrice: 12),
    ProductModel(name: "Product name", description: "Product description", oldPrice: 14, newPrice: 12),
    ProductModel(name: "Product name", description: "Product description", oldPrice: 14, newPrice: 12),
    ProductModel(name: "Product name", description: "Product description", oldPrice: 14, newPrice: 12),
    ProductModel(name: "Product name", description: "Product description", oldPrice: 14, newPrice: 12),
    ProductModel(name: "Product name", description: "Product description", oldPrice: 14, newPrice: 12),
  ];

  @override
  Widget build(BuildContext context) {
    double h = AppResponsive.bodyHeightWithBottomNav(context);

    return OrientationBuilder(
      builder: (context, orientation) {
        bool isLandscape = orientation == Orientation.landscape;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Products Section
            SizedBox(
              height: isLandscape ? h * 0.6 : h * 0.7,
              child: isLandscape
                  ? GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // عمودين في اللاندسكيب
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 3, // شكل المنتج أعرض
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    child: ProductCard(product: product),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ProductDetails()),
                      );
                    },
                  );
                },
              )
                  : ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return SizedBox(
                    height: h * .2,
                    child: GestureDetector(
                      child: ProductCard(product: product),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ProductDetails()),
                        );
                      },
                    ),
                  );
                },
              ),
            ),

            // Checkout Section
            Expanded(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.0,  vertical:isLandscape ?0: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: "Subtotal", size: 15, color: Colors.grey.shade700),
                        const CustomText(text: "36.00 KD", size: 15),
                      ],
                    ),
                    const Gap(2),
                    isLandscape?SizedBox.shrink():Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: "Shipping Charges", size: 15, color: Colors.grey.shade700),
                        const CustomText(text: "1.50 KD", size: 15),
                      ],
                    ),
                    const Gap(2),
                   isLandscape?SizedBox.shrink(): Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        CustomText(text: "Total", size: 14),
                        CustomText(text: "37.50 KD", size: 14),
                      ],
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        width: isLandscape ? 220 : 181,
                        height: 45,
                        child: const Center(
                          child: Text(
                            "Proceed To Checkout",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
