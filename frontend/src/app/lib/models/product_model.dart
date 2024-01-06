class ProductModels {
  int product_id;
  String name;
  int price;
  String image_url;
  int category_id;

  ProductModels(
      {required this.product_id,
      required this.name,
      required this.price,
      required this.image_url,
      required this.category_id});

  factory ProductModels.fromJson(Map<String, dynamic> json) {
    // Đảm bảo rằng product_id là một số nguyên và name là một chuỗi.
    if (json["product_id"] is int && json["name"] is String) {
      return ProductModels(
          product_id: json["product_id"],
          name: json["name"],
          price: json["price"],
          image_url: json["image_url"],
          category_id: json["category_id"]);
    } else {
      throw FormatException('Invalid type for table_id or table_name');
    }
  }
}
