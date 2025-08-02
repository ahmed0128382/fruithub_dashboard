import 'package:fruithub_dashboard/features/view_orders/domain/entities/order_product_entity.dart';
import 'package:fruithub_dashboard/features/view_orders/domain/entities/shipping_address_entity.dart';

class OrderEntity {
  final String uId;
  final num totalPrice;
  final ShippingAddressEntity shippingAddressEntity;
  final List<OrderProductEntity> orderProducts;
  final String paymentMethod;
  OrderEntity(
      {required this.uId,
      required this.totalPrice,
      required this.shippingAddressEntity,
      required this.orderProducts,
      this.paymentMethod = 'PayPal'});
}
