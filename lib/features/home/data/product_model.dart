class ProductModel {
  final int id;
  final String title;
  final String description;
  final num price, oldPrice;
  final String image;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.oldPrice,
    required this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? "",
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      price: json['price'] ?? 0,
      oldPrice: json['old_price'] ?? 0,
      image: json['thumbnail'] ?? "",
    );
  }

  toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'old_price': oldPrice,
      'thumbnail': image,
    };
  }
}
