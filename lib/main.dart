import 'package:flutter/material.dart';
import 'package:fruithub_dashboard/core/helper/on_generate_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fruithub_dashboard/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Supabase.initialize(
    url: 'https://orcpdxpuacfdvclnyxep.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9yY3BkeHB1YWNmZHZjbG55eGVwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTI1ODIxNzEsImV4cCI6MjA2ODE1ODE3MX0.8aLks6TnE6N4M9OakNy1llBpe6FBliVrlCE8quRZUWM',
  );
  final supabase = Supabase.instance.client;

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
