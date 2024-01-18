import 'package:firebase_database/firebase_database.dart';
import 'package:app/models/table_model.dart';

class TableController {
  final DatabaseReference _tableRef =
      FirebaseDatabase.instance.ref().child('table');

  Future<List<TableModel>> getTables() async {
    try {
      DataSnapshot snapshot = await _tableRef.get();
      if (snapshot.exists) {
        List<TableModel> tables = [];
        for (var child in snapshot.children) {
          tables.add(TableModel.fromSnapshot(child));
        }
        return tables;
      } else {
        throw Exception('No data available');
      }
    } catch (e) {
      throw Exception('Failed to load tables: $e');
    }
  }

  Future<int> countTablesByStatus(String status) async {
    try {
      List<TableModel> tables = await getTables();
      return tables.where((table) => table.status == status).length;
    } catch (e) {
      throw Exception('Failed to count tables: $e');
    }
  }
}
