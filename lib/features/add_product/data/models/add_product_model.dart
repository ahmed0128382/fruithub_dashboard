import 'package:fruithub_dashboard/features/add_product/domain/entities/add_product_entity.dart';

class AddProductModel {
  final String name;
  final String description;
  final num price;
  final dynamic image;
  final String code;
  final bool isFeatured;
  String? imageUrl;

  AddProductModel({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.code,
    required this.isFeatured,
    this.imageUrl,
  });
  factory AddProductModel.fromEntity(AddProductEntity product) =>
      AddProductModel(
          name: product.name,
          description: product.description,
          price: product.price,
          image: product.image,
          code: product.code,
          isFeatured: product.isFeatured,
          imageUrl: product.imageUrl);
  toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'code': code,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
    };
  }
}
