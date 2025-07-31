import 'package:fruithub_dashboard/features/add_product/data/models/review_model.dart';
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
  final int sellingCount;
  final List<ReviewModel> reviews;

  AddProductModel(
      {required this.name,
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
      this.sellingCount = 0,
      required this.reviews});
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
        reviews: product.reviews.map((e) => ReviewModel.fromEntity(e)).toList(),
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
      'sellingCount': sellingCount,
      'reviews': reviews.map((e) => e.toJson()).toList(),
      //'avgRating': avgRating,
      //'ratingsCount': ratingsCount
    };
  }
}
