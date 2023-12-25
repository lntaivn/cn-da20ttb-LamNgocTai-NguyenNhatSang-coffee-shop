// import 'package:app/controllers/table_list_controller.dart';
import 'package:app/controllers/table_list_controller.dart';
import 'package:app/models/table_model.dart';
import 'package:app/screens/order_details.dart';
import 'package:app/screens/product_list.dart';
import 'package:app/theme.dart';
import 'package:flutter/material.dart';

class TableList extends StatefulWidget {
  const TableList({super.key});

  @override
  State<TableList> createState() => _TableListState();
}

class _TableListState extends State<TableList> {
  final TableListController _controller = TableListController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Table List'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppTheme.primaryColor,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          onTap: (int index) {
            switch (index) {
              case 0:
                // Nhấn Table
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const TableList()));
                break;

              case 1:
                // Nhấn Order
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const TableList()));
                break;

              case 2:
                // Nhấn Payment
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OrderDetails()));
                break;

              case 3:
                // Nhấn Profile
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const TableList()));
                break;
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.table_restaurant_outlined,
                color: AppTheme.primaryColor,
              ),
              label: 'Table',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.checklist_rounded,
                  color: AppTheme.primaryColor,
                ),
                label: 'Order'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.payment_rounded,
                  color: AppTheme.primaryColor,
                ),
                label: 'Payment'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_2_outlined,
                  color: AppTheme.primaryColor,
                ),
                label: 'Profile'),
          ],
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Order Number: 10',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Empty Table: 00',
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
                    return Center(child: CircularProgressIndicator());
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
                                color: const Color(0xFF42A5F5),
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
                                    table.table_name, // Hiển thị tên bàn từ API
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
                    return Center(child: Text("No data available"));
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
