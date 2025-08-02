import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruithub_dashboard/constants.dart';
import 'package:fruithub_dashboard/core/helper/get_oder_dummy_data.dart';
import 'package:fruithub_dashboard/core/widgets/custom_skeletonizer.dart';
import 'package:fruithub_dashboard/core/widgets/search_text_field.dart';
import 'package:fruithub_dashboard/features/view_orders/domain/entities/order_entity.dart';
import 'package:fruithub_dashboard/features/view_orders/presentation/manager/view_orders_cubit/view_orders_cubit.dart';
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
            child: BlocBuilder<ViewOrdersCubit, ViewOrdersState>(
              builder: (context, state) {
                final isLoading = state is ViewOrdersLoading;

                if (state is ViewOrdersFailure) {
                  return Center(child: Text(state.message));
                }

                final orders = isLoading
                    ? List.generate(6, (_) => generateDummyOrderEntity())
                    : (state is ViewOrdersSuccess ? state.orders : []);

                return CustomSkeletonizer(
                  isLoading: isLoading,
                  child: OrderItemsListView(orders: orders.cast<OrderEntity>()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
