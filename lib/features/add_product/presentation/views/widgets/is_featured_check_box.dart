import 'package:flutter/material.dart';
import 'package:fruithub_dashboard/core/utils/app_colors.dart';
import 'package:fruithub_dashboard/core/utils/app_styles.dart';
import 'package:fruithub_dashboard/features/add_product/presentation/views/widgets/custom_check_box.dart';

class IsFeaturedCheckBox extends StatefulWidget {
  const IsFeaturedCheckBox({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;

  @override
  State<IsFeaturedCheckBox> createState() => _IsFeaturedCheckBoxState();
}

class _IsFeaturedCheckBoxState extends State<IsFeaturedCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomCheckBox(
          isChecked: isChecked,
          onChecked: (value) {
            setState(() => isChecked = value);
            widget.onChanged(value);
          },
        ),
        SizedBox(width: 16.0),
        Expanded(
          child: Text(
            'Is Featured Item?',
            style: AppStyles.semiBold16.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
