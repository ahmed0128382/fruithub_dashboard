import 'package:fruithub_dashboard/features/view_orders/data/models/order_product_model.dart';
import 'package:fruithub_dashboard/features/view_orders/data/models/shipping_address_model.dart';
import 'package:fruithub_dashboard/features/view_orders/domain/entities/order_entity.dart';

class OrderModel {
  final String uId;
  final num totalPrice;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;
  OrderModel(
      {required this.uId,
      required this.totalPrice,
      required this.shippingAddressModel,
      required this.orderProducts,
      this.paymentMethod = 'PayPal'});

  toJson() {
    return {
      'uId': uId,
      'totalPrice': totalPrice,
      'status': 'Pending',
      'date': DateTime.now().toString(),
      'shippingAddressModel': shippingAddressModel.toJson(),
      'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
      'paymentMethod': paymentMethod,
    };
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      uId: json['uId'],
      totalPrice: json['totalPrice'],
      shippingAddressModel:
          ShippingAddressModel.fromJson(json['shippingAddressModel']),
      orderProducts: json['orderProducts']
          .map((e) => OrderProductModel.fromJson(e))
          .toList(),
      paymentMethod: json['paymentMethod'],
    );
  }
  OrderEntity toEntity() {
    return OrderEntity(
        uId: uId,
        totalPrice: totalPrice,
        shippingAddressEntity: shippingAddressModel.toEntity(),
        orderProducts: orderProducts.map((e) => e.toEntity()).toList(),
        paymentMethod: paymentMethod);
  }
}
