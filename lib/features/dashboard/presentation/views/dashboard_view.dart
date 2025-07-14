import 'package:flutter/material.dart';
import 'package:fruithub_dashboard/core/widgets/custom_app_bar.dart';
import 'package:fruithub_dashboard/features/dashboard/presentation/views/widgets/dashboard_view_body.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});
  static const String routeName = 'dashboard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'Dashboard'),
      body: const DashboardViewBody(),
    );
  }
}
