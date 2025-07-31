import 'package:flutter/material.dart';
import 'package:fruithub_dashboard/features/add_product/view_orders/data/models/order_model.dart';

class OrderItemWidget extends StatelessWidget {
  final OrderModel order;

  const OrderItemWidget({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final shipping = order.shippingAddressModel;

    return Card(
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 📦 Order Summary
            Text(
              'العميل: ${shipping.name ?? ''}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 4),
            Text('رقم الهاتف: ${shipping.phoneNumber ?? ''}'),
            Text('العنوان: ${shipping.toString()}'),

            const Divider(height: 24),

            // 🛒 Products List
            Text('المنتجات:', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 8),
            ...order.orderProducts.map((product) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          product.imageUrl,
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => const Icon(Icons.image),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600)),
                            Text(
                                'الكمية: ${product.quantity}  ×  ${product.price} EGP'),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),

            const Divider(height: 24),

            // 💰 Payment Info
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('الإجمالي:',
                    style: Theme.of(context).textTheme.titleMedium),
                Text('${order.totalPrice.toStringAsFixed(2)} EGP',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 8),
            Text('طريقة الدفع: ${order.paymentMethod}'),
          ],
        ),
      ),
    );
  }
}
