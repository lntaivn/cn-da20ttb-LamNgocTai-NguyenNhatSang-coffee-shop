import 'package:firebase_database/firebase_database.dart';

class TableModel {
  int tableId;
  String tableName;
  String status;

  TableModel({
    required this.tableId,
    required this.tableName,
    required this.status,
  });

  factory TableModel.fromSnapshot(DataSnapshot snapshot) {
    if (snapshot.value is Map) {
      Map<String, dynamic> json =
          Map<String, dynamic>.from(snapshot.value as Map);
      return TableModel(
        tableId: json['tableId'],
        tableName: json['tableName'],
        status: json['status'] ?? '',
      );
    } else {
      throw Exception('Expected the data to be a map');
    }
  }
}
