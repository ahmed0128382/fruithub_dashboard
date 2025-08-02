import 'package:flutter/widgets.dart';
import 'package:fruithub_dashboard/constants.dart';
import 'package:fruithub_dashboard/core/helper/get_oder_dummy_data.dart';
import 'package:fruithub_dashboard/core/widgets/search_text_field.dart';
import 'package:fruithub_dashboard/features/view_orders/presentation/views/widgets/order_items_list_view.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          const SizedBox(height: kCustomPadding),
          const SearchTextField(),
          const SizedBox(height: kCustomPadding),
          Expanded(
            child: OrderItemsListView(orders: [
              generateDummyOrderEntity(),
              generateDummyOrderEntity(),
              generateDummyOrderEntity(),
              generateDummyOrderEntity(),
            ]),
          ),
        ],
      ),
    );
  }
}
