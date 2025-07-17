import 'package:flutter/material.dart';
import 'package:fruithub_dashboard/core/utils/app_colors.dart';
import 'package:fruithub_dashboard/core/utils/app_styles.dart';

import 'package:fruithub_dashboard/features/add_product/presentation/views/widgets/custom_check_box.dart';

class IsOrganicCheckBox extends StatefulWidget {
  const IsOrganicCheckBox({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;

  @override
  State<IsOrganicCheckBox> createState() => _IsOrganicCheckBoxState();
}

class _IsOrganicCheckBoxState extends State<IsOrganicCheckBox> {
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
        Text(
          'Is Item Organic?',
          style: AppStyles.semiBold16.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
