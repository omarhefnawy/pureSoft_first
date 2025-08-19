import 'package:flutter/material.dart';
import 'package:fruits_task/core/config/app_responsive.dart';
import 'package:fruits_task/models/product_model.dart';
import 'package:fruits_task/view/screens/product_details.dart';
import 'package:fruits_task/view/widgets/product_card.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<ProductModel> products = List.generate(
    6,
        (index) => ProductModel(
      name: "Product name",
      description: "Product description",
      oldPrice: 14,
      newPrice: 12,
    ),
  );

  @override
  Widget build(BuildContext context) {
    double h = AppResponsive.bodyHeightWithBottomNav(context);
    double w = AppResponsive.width(context);
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: isLandscape
          ? GridView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // صفين في الوضع الأفقي
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: w / (h * 0.85),
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => ProductDetails()));
            },
            child: ProductCard(product: product, forFav: true),
          );
        },
      )
          : ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return SizedBox(
            height: h * .2,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ProductDetails()));
                },
                child: ProductCard(product: product, forFav: true),
              ),
            ),
          );
        },
      ),
    );
  }
}
