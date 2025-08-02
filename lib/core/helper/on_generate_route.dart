import 'package:flutter/material.dart';
import 'package:fruithub_dashboard/features/add_product/presentation/views/add_product_view.dart';
import 'package:fruithub_dashboard/features/view_orders/presentation/views/orders_view.dart';
import 'package:fruithub_dashboard/features/dashboard/presentation/views/dashboard_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case DashboardView.routeName:
      return MaterialPageRoute(builder: (context) => const DashboardView());
    case AddProductView.routeName:
      return MaterialPageRoute(builder: (context) => const AddProductView());
    case OrdersView.routeName:
      return MaterialPageRoute(builder: (context) => const OrdersView());

    default:
      return MaterialPageRoute(builder: (context) => const DashboardView());
  }
}
