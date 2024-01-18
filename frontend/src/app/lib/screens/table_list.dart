import 'package:app/controllers/invoice_controller.dart';
import 'package:app/controllers/table_controller.dart';
import 'package:app/models/table_model.dart';
import 'package:app/screens/product_list.dart';
import 'package:app/theme.dart';
import 'package:app/widgets/botton_nav_bar.dart';
import 'package:flutter/material.dart';

class TableList extends StatefulWidget {
  const TableList({super.key});

  @override
  State<TableList> createState() => _TableListState();
}

class _TableListState extends State<TableList> {
  final TableController _controller = TableController();
  final InvoiceController _invoiceController = InvoiceController();
  int emptyTableCount = 0;
  int invoiceCount = 0;

  @override
  void initState() {
    super.initState();
    _loadEmptyTableCount();
    _loadInvoiceData();
  }

  void _loadEmptyTableCount() async {
    try {
      int emptyTableCount = await _controller.countTablesByStatus("Empty");
      setState(() {
        this.emptyTableCount = emptyTableCount;
      });
    } catch (e) {
      // Xử lý lỗi
    }
  }

  void _loadInvoiceData() async {
    try {
      int count = await _invoiceController.getInvoiceCount();
      setState(() {
        invoiceCount = count;
      });
    } catch (e) {
      // Xử lý lỗi
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Table List'),
        ),
        bottomNavigationBar: BottonNavBar(),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Invoice: $invoiceCount',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Empty: $emptyTableCount',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder<List<TableModel>>(
                future: _controller.getTables(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Hiển thị bộ quay vòng khi đang tải dữ liệu
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    // Hiển thị thông báo lỗi nếu có
                    return Center(child: Text("Error: ${snapshot.error}"));
                  } else if (snapshot.hasData) {
                    // Lấy dữ liệu từ snapshot
                    List<TableModel> tables = snapshot.data!;
                    return GridView.count(
                      crossAxisCount: 3,
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      children: List.generate(tables.length, (index) {
                        // Lấy thông tin của từng bàn
                        TableModel table = tables[index];
                        Color tableColor = table.status == "Empty"
                            ? Color(0xFF42A5F5)
                            : Color.fromRGBO(255, 152, 67, 1);
                        return Center(
                          child: GestureDetector(
                            onTap: () {
                              // Hành động khi nhấn vào ô GridView (ví dụ chuyển sang màn hình ProductList)
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ProductList(),
                                ),
                              );
                            },
                            child: Container(
                              width: 90.0,
                              height: 90.0,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 3,
                                    blurRadius: 8,
                                    offset: const Offset(3, 5),
                                  ),
                                ],
                                color: tableColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.table_bar_outlined,
                                    color: AppTheme.whiteColor,
                                    size: 28,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    table.tableName, // Hiển thị tên bàn từ API
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    );
                  } else {
                    // Hiển thị thông báo khi không có dữ liệu
                    return const Center(child: Text("No data available"));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
