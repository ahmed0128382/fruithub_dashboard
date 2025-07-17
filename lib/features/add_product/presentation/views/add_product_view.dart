import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruithub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruithub_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:fruithub_dashboard/core/services/get_it_service.dart';
import 'package:fruithub_dashboard/core/widgets/custom_app_bar.dart';
import 'package:fruithub_dashboard/features/add_product/presentation/manager/cubit/add_products_cubit.dart';
import 'package:fruithub_dashboard/features/add_product/presentation/views/widgets/add_product_view_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const String routeName = 'add_product';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'Add Product'),
      body: BlocProvider(
        create: (context) => AddProductsCubit(
            getIt.get<ImagesRepo>(), getIt.get<ProductsRepo>()),
        child: const AddProductViewBody(),
      ),
    );
  }
}
