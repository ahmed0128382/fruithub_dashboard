import 'package:bloc/bloc.dart';
import 'package:fruithub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruithub_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:fruithub_dashboard/features/add_product/domain/entities/add_product_entity.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utils/backend_endpoints.dart';

part 'add_products_state.dart';

class AddProductsCubit extends Cubit<AddProductsState> {
  AddProductsCubit(this.imagesRepo, this.productsRepo)
      : super(AddProductsInitial());

  final ImagesRepo imagesRepo;
  final ProductsRepo productsRepo;

  Future<void> addProduct(AddProductEntity product) async {
    emit(AddProductsLoading());
    final result = await imagesRepo.uploadFile(
        file: product.image, path: BackendEndpoints.images);
    result.fold((failure) => emit(AddProductsFailure(message: failure.message)),
        (url) async {
      product.imageUrl = url;
      var result = await productsRepo.addProduct(product);
      result.fold((failure) {
        emit(AddProductsFailure(message: failure.message));
      }, (r) {
        emit(AddProductsSuccess());
      });
    });
  }
}
