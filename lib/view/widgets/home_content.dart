import 'package:flutter/material.dart';
import 'package:fruits_task/core/config/app_responsive.dart';
import 'package:fruits_task/view/widgets/sellere_content.dart';
import 'package:gap/gap.dart';

import '../../core/config/appColors.dart';
import '../../core/utils/widgets/custom_text.dart';
import '../../models/sellerModel.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      "assets/category/fruit.png",
      "assets/category/caf.png",
      "assets/category/farmacy.png",
      "assets/category/farm.png",
      "assets/category/fruit.png",
      "assets/category/caf.png",
      "assets/category/farmacy.png",
      "assets/category/farm.png",
    ];

    List<SellerModel> sellers = [
      SellerModel(image: "assets/logo/logo.png", name: "Seller name", space: 1.5, opened: false, charge: 10.0, reviews: 4.5),
      SellerModel(image: "assets/logo/logo.png", name: "Seller name", space: 1.5, opened: true, charge: 10.0, reviews: 4.5),
      SellerModel(image: "assets/logo/logo.png", name: "Seller name", space: 1.5, opened: false, charge: 10.0, reviews: 4.5),
      SellerModel(image: "assets/logo/logo.png", name: "Seller name", space: 1.5, opened: true, charge: 10.0, reviews: 4.5),
      SellerModel(image: "assets/logo/logo.png", name: "Seller name", space: 1.5, opened: true, charge: 10.0, reviews: 4.5),
      SellerModel(image: "assets/logo/logo.png", name: "Seller name", space: 1.5, opened: false, charge: 10.0, reviews: 4.5),
    ];

    double h = AppResponsive.bodyHeightWithBottomNav(context);
    double w = MediaQuery.of(context).size.width;

    return OrientationBuilder(
      builder: (context, orientation) {
        bool isLandscape = orientation == Orientation.landscape;

        return CustomScrollView(
          slivers: [
            // ✅ Slider Section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: isLandscape ? h * 0.35 : h * 0.22,
                    width: double.infinity,
                    child: Image.asset("assets/home/carosal.png", fit: BoxFit.cover),
                  ),
                ),
              ),
            ),

            // ✅ Categories
            SliverToBoxAdapter(
              child: SizedBox(
                height: isLandscape ? h * 0.22 : h * 0.15,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return _buildCategory(images[index]);
                  },
                ),
              ),
            ),

            const SliverToBoxAdapter(child: Gap(10)),

            // ✅ Sellers Title
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CustomText(text: "Sellers", color: AppColors.primary, size: 18),
                    CustomText(text: "Show all", color: Colors.lightBlue, size: 16),
                  ],
                ),
              ),
            ),

            const SliverToBoxAdapter(child: Gap(8)),

            // ✅ Sellers List
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  final data = sellers[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    child: SellereContent(sellerModel: data),
                  );
                },
                childCount: sellers.length,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCategory(String image) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      color: Colors.grey.shade200,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Image.asset(image),
      ),
    );
  }
}
