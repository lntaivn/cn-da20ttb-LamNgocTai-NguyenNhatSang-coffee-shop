class CategoriesModel {
  int category_id;
  String name;

  CategoriesModel({
    required this.category_id,
    required this.name,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    // Đảm bảo rằng category_id là một số nguyên và name là một chuỗi.
    if (json["category_id"] is int && json["name"] is String) {
      return CategoriesModel(
        category_id: json["category_id"],
        name: json["name"],
      );
    } else {
      throw const FormatException('Invalid type for category_id or name');
    }
  }
}
