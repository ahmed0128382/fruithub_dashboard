class OrderProductModel {
  final String name;
  final String imageUrl;
  final int quantity;
  final num price;
  final String code;

  OrderProductModel(
      {required this.name,
      required this.imageUrl,
      required this.quantity,
      required this.price,
      required this.code});

  toJson() => {
        'name': name,
        'imageUrl': imageUrl,
        'quantity': quantity,
        'price': price,
        'code': code,
      };

  factory OrderProductModel.fromJson(Map<String, dynamic> json) =>
      OrderProductModel(
        name: json['name'],
        imageUrl: json['imageUrl'],
        quantity: json['quantity'],
        price: json['price'],
        code: json['code'],
      );
}
