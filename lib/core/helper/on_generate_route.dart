import 'package:flutter/material.dart';
import 'package:fruithub_dashboard/features/dashboard/presentation/views/dashboard_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case DashboardView.routeName:
      return MaterialPageRoute(builder: (context) => const DashboardView());
    default:
      return MaterialPageRoute(builder: (context) => const DashboardView());
  }
}
