import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruithub_dashboard/core/helper/build_bar.dart';
import 'package:fruithub_dashboard/core/widgets/custom_progress_hud.dart';
import 'package:fruithub_dashboard/features/add_product/presentation/manager/cubit/add_products_cubit.dart';
import 'package:fruithub_dashboard/features/add_product/presentation/views/widgets/add_product_view_body.dart';

class AddProductsViewBodyBlocConsumer extends StatelessWidget {
  const AddProductsViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductsCubit, AddProductsState>(
      listener: (context, state) {
        if (state is AddProductsSuccess) {
          buildBar(context, 'Product added successfully');
        } else if (state is AddProductsFailure) {
          buildBar(context,
              'there is an error in adding Product : ${state.message}');
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
            isLoading: state is AddProductsLoading,
            child: AddProductViewBody());
      },
    );
  }
}
