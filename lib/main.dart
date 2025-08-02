import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruithub_dashboard/constants.dart';
import 'package:fruithub_dashboard/core/helper/on_generate_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fruithub_dashboard/core/repos/orders_repo/orders_repo.dart';
import 'package:fruithub_dashboard/core/services/custom_bloc_observer.dart';
import 'package:fruithub_dashboard/core/services/get_it_service.dart';
import 'package:fruithub_dashboard/core/services/supabase_storage_service.dart';
import 'package:fruithub_dashboard/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:fruithub_dashboard/features/view_orders/presentation/manager/view_orders_cubit/view_orders_cubit.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await SupabaseStorageService.initSupabase();
  await SupabaseStorageService.createBucket(fruitBucketName);
  // final supabase = Supabase.instance.client;
  setupGetIt();
  runApp(const FruitHubDashboard());
}

class FruitHubDashboard extends StatelessWidget {
  const FruitHubDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ViewOrdersCubit>(
          create: (context) => ViewOrdersCubit(
            getIt.get<OrdersRepo>(),
          ),
        ),
      ],
      child: const MaterialApp(
        initialRoute: DashboardView.routeName,
        onGenerateRoute: onGenerateRoute,
        home: DashboardView(),
      ),
    );
  }
}
