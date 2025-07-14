import 'package:flutter/material.dart';
import 'package:fruithub_dashboard/core/helper/on_generate_route.dart';

void main() {
  runApp(const FruitHubDashboard());
}

class FruitHubDashboard extends StatelessWidget {
  const FruitHubDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: onGenerateRoute,
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
