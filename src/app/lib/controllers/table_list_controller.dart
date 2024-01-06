import 'dart:convert';
import 'package:app/models/table_model.dart';
import 'package:http/http.dart' as http;

class TableListController {
  Future<List<TableModel>> getTables() async {
    var url =
        "https://my-json-server.typicode.com/nnsang1309/json-server/tableorder";

    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return List<TableModel>.from(
            data.map((table) => TableModel.fromJson(table)));
      } else {
        // Thêm thông tin lỗi chi tiết
        throw Exception(
            'Failed to load API with status code: ${response.statusCode}');
      }
    } catch (e) {
      // Bắt và xử lý lỗi, có thể là lỗi mạng hoặc lỗi từ jsonDecode
      throw Exception('Failed to load API: $e');
    }
  }
}
