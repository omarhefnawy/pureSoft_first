import 'package:flutter/material.dart';
import 'package:fruits_task/core/config/appColors.dart';
import 'package:fruits_task/core/config/app_responsive.dart';
import 'package:fruits_task/core/utils/widgets/custom_text.dart';
import 'package:fruits_task/models/order_model.dart';
import 'package:fruits_task/view/screens/order_tracking.dart';
import 'package:gap/gap.dart';
import 'package:svg_flutter/svg.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List<OrderModel> orders = [
    OrderModel(
      name: "#243188 - 37 KD",
      itemNumbers: 3,
      status: "Delivering",
      color: Colors.yellow,
      date: "8 Sep",
    ),
    OrderModel(
      name: "#882610",
      itemNumbers: 3,
      status: "Finished",
      color: Colors.green,
      date: "8 Sep",
    ),
    OrderModel(
      name: "#882610",
      itemNumbers: 3,
      status: "Canceled",
      color: Colors.red,
      date: "8 Sep",
    ),
    OrderModel(
      name: "#882610",
      itemNumbers: 3,
      status: "Working",
      color: Colors.blue,
      date: "8 Sep",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double h = AppResponsive.bodyHeightWithBottomNav(context);

    return OrientationBuilder(
      builder: (context, orientation) {
        bool isLandscape = orientation == Orientation.landscape;

        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: isLandscape
              ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3.1, // شكل الكارد عريض مش طويل
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: orders.length,
            itemBuilder: (context, index) {
              return _buildOrderCard(context, orders[index], h);
            },
          )
              : ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              return _buildOrderCard(context, orders[index], h);
            },
          ),
        );
      },
    );
  }

  Widget _buildOrderCard(BuildContext context, OrderModel order, double h) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OrderTracking(),
            ));
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              blurRadius: 8,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Row(
          children: [
            // Left Icon
            Container(
              width: AppResponsive.isMobile(context) ? 50 : 60,
              height: AppResponsive.isMobile(context) ? 50 : 60,
              decoration: BoxDecoration(
                color: order.color.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                "assets/icons/car.svg",
                width: 28,
                height: 28,
                color: order.color,
              ),
            ),
            const Gap(16),
            // Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: order.name,
                    size: AppResponsive.isMobile(context) ? 14 : 16,
                  ),
                  const Gap(4),
                  Row(
                    children: [
                      Icon(Icons.calendar_today,
                          size: 14, color: Colors.grey[600]),
                      const Gap(4),
                      CustomText(
                        text: order.date,
                        size: 13,
                        color: Colors.grey.shade600,
                      ),
                      const Gap(10),
                      Icon(Icons.shopping_bag,
                          size: 14, color: Colors.grey[600]),
                      const Gap(4),
                      CustomText(
                          text: "${order.itemNumbers} items",
                          size: 13,
                          color: Colors.grey.shade600),
                    ],
                  ),
                  const Gap(6),
                  CustomText(
                    text: "Status: ${order.status}",
                    size: 13,
                    color: order.color,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Colors.grey[500],
            ),
          ],
        ),
      ),
    );
  }
}
