class ProductModels {
  int productId;
  String productName;
  int price;
  String imageUrl;
  int categoryId;

  ProductModels(
      {required this.productId,
      required this.productName,
      required this.price,
      required this.imageUrl,
      required this.categoryId});

  factory ProductModels.fromJson(Map<String, dynamic> json) {
    // Đảm bảo rằng productId là một số nguyên và productName là một chuỗi.
    if (json["productId"] is int && json["productName"] is String) {
      return ProductModels(
          productId: json["productId"],
          productName: json["productName"],
          price: json["price"],
          imageUrl: json["imageUrl"],
          categoryId: json["categoryId"]);
    } else {
      throw const FormatException('Invalid type for productId or productName');
    }
  }
}
