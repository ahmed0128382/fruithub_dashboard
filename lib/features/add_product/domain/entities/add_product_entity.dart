class AddProductEntity {
  final String name;
  final String description;
  final num price;
  final dynamic image;
  final String code;
  final bool isFeatured;
  final String? imageUrl;

  AddProductEntity({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.code,
    required this.isFeatured,
    this.imageUrl,
  });
}
