import 'package:dartz/dartz.dart';
import 'package:fruithub_dashboard/core/errors/failure.dart';
import 'package:fruithub_dashboard/features/view_orders/domain/entities/order_entity.dart';

abstract class OrdersRepo {
  //Future<Either<Failure, void>> addOrder(OrderEntity OrderEntity);
  Future<Either<Failure, List<OrderEntity>>> getOrders();
}
