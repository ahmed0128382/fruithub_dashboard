part of 'add_products_cubit.dart';

@immutable
sealed class AddProductsState {}

final class AddProductsInitial extends AddProductsState {}

final class AddProductsLoading extends AddProductsState {}

final class AddProductsFailure extends AddProductsState {
  final String message;
  AddProductsFailure({required this.message});
}

final class AddProductsSuccess extends AddProductsState {}
