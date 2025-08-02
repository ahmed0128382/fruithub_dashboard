import 'package:flutter/material.dart';
import 'package:fruithub_dashboard/features/view_orders/domain/entities/order_entity.dart';
import 'package:fruithub_dashboard/features/view_orders/presentation/views/widgets/order_item.dart';

class OrderItemsListView extends StatelessWidget {
  const OrderItemsListView({super.key, required this.orders});
  final List<OrderEntity> orders;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          return OrderItemWidget(order: orders[index]);
        },
        itemCount: orders.length);
  }
}
