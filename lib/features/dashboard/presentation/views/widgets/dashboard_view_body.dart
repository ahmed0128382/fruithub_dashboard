import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fruithub_dashboard/constants.dart';
import 'package:fruithub_dashboard/core/widgets/custom_button.dart';
import 'package:fruithub_dashboard/features/add_product/presentation/views/add_product_view.dart';
import 'package:fruithub_dashboard/features/add_product/view_orders/presentation/views/orders_view.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
              text: 'Add Data',
              onTap: () {
                Navigator.pushNamed(context, AddProductView.routeName);
              }),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
              text: 'View Orders',
              onTap: () {
                Navigator.pushNamed(context, OrdersView.routeName);
              }),
        ],
      ),
    );
  }
}
