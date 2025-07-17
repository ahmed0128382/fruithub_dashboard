class AddProductEntity {
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

  AddProductEntity({
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
}
