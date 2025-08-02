class OrderProductEntity {
  final String name;
  final String imageUrl;
  final int quantity;
  final num price;
  final String code;

  OrderProductEntity(
      {required this.name,
      required this.imageUrl,
      required this.quantity,
      required this.price,
      required this.code});
}
