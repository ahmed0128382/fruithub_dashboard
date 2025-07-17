import 'package:fruithub_dashboard/features/add_product/domain/entities/add_product_entity.dart';

class AddProductModel {
  final String name;
  final String description;
  final num price;
  final dynamic image;
  final String code;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonths;
  final bool isOrganic;
  final int noOfCalories;
  final int unitAmount;
  final num avgRating;
  final num ratingsCount;

  AddProductModel({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.code,
    required this.isFeatured,
    this.imageUrl,
    required this.expirationMonths,
    this.isOrganic = false,
    required this.noOfCalories,
    required this.unitAmount,
    this.avgRating = 0,
    this.ratingsCount = 0,
  });
  factory AddProductModel.fromEntity(AddProductEntity product) =>
      AddProductModel(
        name: product.name,
        description: product.description,
        price: product.price,
        image: product.image,
        code: product.code,
        isFeatured: product.isFeatured,
        imageUrl: product.imageUrl,
        expirationMonths: product.expirationMonths,
        isOrganic: product.isOrganic,
        noOfCalories: product.noOfCalories,
        unitAmount: product.unitAmount,
        //avgRating: product.avgRating,
        //ratingsCount: product.ratingsCount
      );
  toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'code': code,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationMonths': expirationMonths,
      'isOrganic': isOrganic,
      'noOfCalories': noOfCalories,
      'unitAmount': unitAmount,
      //'avgRating': avgRating,
      //'ratingsCount': ratingsCount
    };
  }
}
