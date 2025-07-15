import 'package:flutter/material.dart';
import 'package:fruithub_dashboard/constants.dart';
import 'package:fruithub_dashboard/core/widgets/custom_text_form_field.dart';

import 'package:fruithub_dashboard/features/add_product/presentation/views/widgets/image_field.dart';
import 'package:fruithub_dashboard/features/add_product/presentation/views/widgets/is_featured_check_box.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: Column(
            children: [
              CustomTextFormField(
                  hintText: 'Product Name', textInputType: TextInputType.text),
              SizedBox(height: 16.0),
              CustomTextFormField(
                hintText: 'Product Price',
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 16.0),
              CustomTextFormField(
                hintText: 'Product Code',
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 16.0),
              CustomTextFormField(
                maxLines: 5,
                hintText: 'Product Description',
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 16.0),
              IsFeaturedCheckBox(
                onChanged: (value) {
                  // Handle featured checkbox change
                },
              ),
              SizedBox(height: 16.0),
              ImageField(
                onFileSelected: (file) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
