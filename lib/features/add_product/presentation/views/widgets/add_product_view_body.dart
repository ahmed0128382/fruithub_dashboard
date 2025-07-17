import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruithub_dashboard/constants.dart';
import 'package:fruithub_dashboard/core/widgets/custom_button.dart';
import 'package:fruithub_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruithub_dashboard/features/add_product/domain/entities/add_product_entity.dart';
import 'package:fruithub_dashboard/features/add_product/presentation/manager/cubit/add_products_cubit.dart';
import 'package:fruithub_dashboard/features/add_product/presentation/views/widgets/image_field.dart';
import 'package:fruithub_dashboard/features/add_product/presentation/views/widgets/is_featured_check_box.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, code, description;
  late num price;
  bool isFeatured = false;
  dynamic file;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              SizedBox(height: 16.0),
              CustomTextFormField(
                  onSaved: (value) => name = value!,
                  hintText: 'Product Name',
                  textInputType: TextInputType.text),
              SizedBox(height: 16.0),
              CustomTextFormField(
                onSaved: (value) => price = num.parse(value!),
                hintText: 'Product Price',
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 16.0),
              CustomTextFormField(
                onSaved: (value) => code = value!.toLowerCase(),
                hintText: 'Product Code',
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 16.0),
              CustomTextFormField(
                onSaved: (value) => description = value!,
                maxLines: 5,
                hintText: 'Product Description',
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 16.0),
              IsFeaturedCheckBox(
                onChanged: (value) {
                  isFeatured = value;
                },
              ),
              SizedBox(height: 16.0),
              ImageField(
                onFileSelected: (file) {
                  this.file = file;
                },
              ),
              SizedBox(height: 24.0),
              CustomButton(
                  text: 'Add Product',
                  onTap: () {
                    if (file == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please select an image')),
                      );
                    } else {
                      //validate form fields first before adding product
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        //create add product entity
                        AddProductEntity addProductEntity = AddProductEntity(
                          name: name,
                          price: price,
                          code: code,
                          description: description,
                          isFeatured: isFeatured,
                          image: file,
                        );
                        //trigger add product
                        context
                            .read<AddProductsCubit>()
                            .addProduct(addProductEntity);
                      } else {
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                      }
                    }
                  }),
              SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
