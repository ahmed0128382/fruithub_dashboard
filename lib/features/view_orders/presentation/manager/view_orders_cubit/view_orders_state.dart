part of 'view_orders_cubit.dart';

@immutable
sealed class ViewOrdersState {}

final class ViewOrdersInitial extends ViewOrdersState {}

class ViewOrdersLoading extends ViewOrdersState {}

class ViewOrdersSuccess extends ViewOrdersState {
  final List<OrderEntity> orders;

  ViewOrdersSuccess(this.orders);
}

class ViewOrdersFailure extends ViewOrdersState {
  final String message;

  ViewOrdersFailure(this.message);
}
