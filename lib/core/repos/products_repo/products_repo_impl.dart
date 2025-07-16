import 'package:dartz/dartz.dart';
import 'package:fruithub_dashboard/core/errors/failure.dart';
import 'package:fruithub_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:fruithub_dashboard/core/services/data_service.dart';
import 'package:fruithub_dashboard/core/services/get_it_service.dart';
import 'package:fruithub_dashboard/core/utils/backend_endpoints.dart';
import 'package:fruithub_dashboard/features/add_product/data/models/add_product_model.dart';
import 'package:fruithub_dashboard/features/add_product/domain/entities/add_product_entity.dart';

class ProductsRepoImpl extends ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImpl({required this.databaseService});
  @override
  Future<Either<Failure, void>> addProduct(AddProductEntity product) async {
    try {
      await getIt.get<DatabaseService>().addData(
            path: BackendEndpoints.products,
            data: AddProductModel.fromEntity(product).toJson(),
          );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: 'Failed to add product'));
    }
  }
}
