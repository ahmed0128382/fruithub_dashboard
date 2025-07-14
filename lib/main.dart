import 'package:flutter/material.dart';
import 'package:fruithub_dashboard/core/helper/on_generate_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fruithub_dashboard/features/dashboard/presentation/views/dashboard_view.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FruitHubDashboard());
}

class FruitHubDashboard extends StatelessWidget {
  const FruitHubDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: DashboardView.routeName,
      onGenerateRoute: onGenerateRoute,
      home: DashboardView(),
    );
  }
}
