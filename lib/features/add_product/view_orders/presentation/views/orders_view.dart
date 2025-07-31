import 'package:flutter/material.dart';
import 'package:fruithub_dashboard/features/add_product/view_orders/presentation/views/widgets/orders_view_body.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});
  static const String routeName = 'orders';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const OrdersViewBody(),
    );
  }
}
