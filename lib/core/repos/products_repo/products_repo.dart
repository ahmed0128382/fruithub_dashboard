import 'package:dartz/dartz.dart';
import 'package:fruithub_dashboard/core/errors/failure.dart';
import 'package:fruithub_dashboard/features/add_product/domain/entities/add_product_entity.dart';

abstract class ProductsRepo {
  Future<Either<Failure, void>> addProduct(AddProductEntity product);
}
