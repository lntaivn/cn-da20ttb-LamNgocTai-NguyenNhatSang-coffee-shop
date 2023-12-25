class TableModel {
  int table_id;
  String table_name;

  TableModel({
    required this.table_id,
    required this.table_name,
  });

  factory TableModel.fromJson(Map<String, dynamic> json) {
    // Đảm bảo rằng table_id là một số nguyên và table_name là một chuỗi.
    if (json["table_id"] is int && json["table_name"] is String) {
      return TableModel(
        table_id: json["table_id"],
        table_name: json["table_name"],
      );
    } else {
      throw FormatException('Invalid type for table_id or table_name');
    }
  }
}
