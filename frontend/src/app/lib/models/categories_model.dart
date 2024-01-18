class CategoriesModel {
  int categoryId;
  String categoryName;

  CategoriesModel({
    required this.categoryId,
    required this.categoryName,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    // Đảm bảo rằng category_id là một số nguyên và name là một chuỗi.
    if (json["categoryId"] is int && json["categoryName"] is String) {
      return CategoriesModel(
        categoryId: json["categoryId"],
        categoryName: json["categoryName"],
      );
    } else {
      throw const FormatException('Invalid type for category_id or name');
    }
  }
}
