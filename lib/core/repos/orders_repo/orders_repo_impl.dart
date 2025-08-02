import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruithub_dashboard/core/errors/failure.dart';
import 'package:fruithub_dashboard/core/repos/orders_repo/orders_repo.dart';
import 'package:fruithub_dashboard/core/services/data_service.dart';
import 'package:fruithub_dashboard/core/utils/backend_endpoints.dart';
import 'package:fruithub_dashboard/features/view_orders/data/models/order_model.dart';
import 'package:fruithub_dashboard/features/view_orders/domain/entities/order_entity.dart';

class OrdersRepoImpl implements OrdersRepo {
  final DatabaseService databaseService;

  OrdersRepoImpl({required this.databaseService});

  @override
  Future<Either<Failure, List<OrderEntity>>> getOrders() async {
    try {
      final List<Map<String, dynamic>> dataList =
          await databaseService.getAllData(path: BackendEndpoints.ordersPath);

      final List<OrderEntity> orders =
          dataList.map((data) => OrderModel.fromJson(data).toEntity()).toList();
      return Right(orders);
    } catch (e) {
      log('Could not fetch orders in getOrders in OrdersRepoImpl: $e');
      return Left(ServerFailure(
          message:
              'Could not fetch orders in getOrders in OrdersRepoImpl: $e'));
    }
  }
}
