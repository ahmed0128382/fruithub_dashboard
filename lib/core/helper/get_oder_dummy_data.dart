import 'package:fruithub_dashboard/features/view_orders/domain/entities/order_entity.dart';
import 'package:fruithub_dashboard/features/view_orders/domain/entities/order_product_entity.dart';
import 'package:fruithub_dashboard/features/view_orders/domain/entities/shipping_address_entity.dart';

OrderEntity generateDummyOrderEntity() {
  final shippingAddress = ShippingAddressEntity(
    name: 'عبدالعزيز موسى',
    email: 'aziz@example.com',
    phoneNumber: '01001234567',
    city: 'القاهرة',
    address: 'شارع الثورة',
    addressDetails: 'عمارة 15، الدور الرابع',
  );

  final orderProducts = [
    OrderProductEntity(
      name: 'مانجو سكري',
      imageUrl: 'https://via.placeholder.com/100x100.png?text=Mango',
      quantity: 2,
      price: 25.0,
      code: 'FR001',
    ),
    OrderProductEntity(
      name: 'تفاح أحمر',
      imageUrl: 'https://via.placeholder.com/100x100.png?text=Apple',
      quantity: 3,
      price: 15.0,
      code: 'FR002',
    ),
    OrderProductEntity(
      name: 'عنب أبيض',
      imageUrl: 'https://via.placeholder.com/100x100.png?text=Grapes',
      quantity: 1,
      price: 30.0,
      code: 'FR003',
    ),
  ];

  final totalPrice = orderProducts.fold<num>(
    0,
    (sum, item) => sum + (item.price * item.quantity),
  );

  return OrderEntity(
    uId: 'user123',
    totalPrice: totalPrice,
    shippingAddressEntity: shippingAddress,
    orderProducts: orderProducts,
    paymentMethod: 'PayPal',
  );
}
