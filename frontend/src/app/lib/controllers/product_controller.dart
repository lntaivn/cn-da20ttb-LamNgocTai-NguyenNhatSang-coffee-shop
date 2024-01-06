import 'dart:convert';
import 'package:app/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductsController {
  Future<List<ProductModels>> getProducts() async {
    var url =
        "https://my-json-server.typicode.com/nnsang1309/json-server/product";

    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return List<ProductModels>.from(
            data.map((product) => ProductModels.fromJson(product)));
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
