import 'package:fruithub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruithub_dashboard/core/repos/images_repo/images_repo_impl.dart';
import 'package:fruithub_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:fruithub_dashboard/core/repos/products_repo/products_repo_impl.dart';
import 'package:fruithub_dashboard/core/services/data_service.dart';
//import 'package:fruithub_dashboard/core/services/fire_storage_service.dart';
import 'package:fruithub_dashboard/core/services/firestore_service.dart';
import 'package:fruithub_dashboard/core/services/storage_service.dart';
import 'package:fruithub_dashboard/core/services/supabase_storage_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupGetIt() {
  //getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<StorageService>(SupabaseStorageService());
  getIt.registerSingleton<DatabaseService>(FirestoreService());
  getIt.registerSingleton<ImagesRepo>(
    ImagesRepoImpl(storageService: getIt.get<StorageService>()),
  );
  getIt.registerSingleton<ProductsRepo>(ProductsRepoImpl(
    databaseService: getIt.get<DatabaseService>(),
  ));
}
