import 'package:bloc/bloc.dart';
import 'package:fruithub_dashboard/core/repos/orders_repo/orders_repo.dart';
import 'package:fruithub_dashboard/features/view_orders/domain/entities/order_entity.dart';
import 'package:meta/meta.dart';

part 'view_orders_state.dart';

class ViewOrdersCubit extends Cubit<ViewOrdersState> {
  final OrdersRepo ordersRepo;

  ViewOrdersCubit(this.ordersRepo) : super(ViewOrdersInitial());

  Future<void> getOrders() async {
    emit(ViewOrdersLoading());
    final result = await ordersRepo.getOrders();
    result.fold(
      (failure) => emit(ViewOrdersFailure(failure.message)),
      (orders) => emit(ViewOrdersSuccess(orders)),
    );
  }
}
