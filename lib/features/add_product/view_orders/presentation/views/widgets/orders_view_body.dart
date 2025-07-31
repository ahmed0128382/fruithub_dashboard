import 'package:flutter/widgets.dart';
import 'package:fruithub_dashboard/constants.dart';
import 'package:fruithub_dashboard/core/widgets/search_text_field.dart';

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
        ],
      ),
    );
  }
}
