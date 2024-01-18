import 'dart:convert';
import 'package:app/models/invoice_model.dart';
import 'package:http/http.dart' as http;

class InvoiceController {
  //GET all invoice
  Future<List<InvoiceModels>> getInvoices() async {
    var url =
        "https://my-json-server.typicode.com/nnsang1309/json-server/invoice";

    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return List<InvoiceModels>.from(
            data.map((invoice) => InvoiceModels.fromJson(invoice)));
      } else {
        throw Exception(
            'Failed to load API with status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load API: $e');
    }
  }

  // GET InvoiceCount
  Future<int> getInvoiceCount() async {
    // Gọi API và trả về số lượng hóa đơn
    try {
      List<InvoiceModels> invoices = await getInvoices();
      return invoices.length;
    } catch (e) {
      throw Exception('Failed to get invoice count: $e');
    }
  }
}
