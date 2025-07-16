import 'package:dartz/dartz.dart';
import 'package:fruithub_dashboard/core/errors/failure.dart';
import 'package:fruithub_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:fruithub_dashboard/features/add_product/domain/entities/add_product_entity.dart';

class ProductsRepoImpl extends ProductsRepo {
  @override
  Future<Either<Failure, void>> addProduct(AddProductEntity product) {
    throw UnimplementedError();
  }
}
