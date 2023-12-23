import 'package:app/screens/order_details.dart';
import 'package:app/screens/product_list.dart'; // Import màn hình bạn muốn chuyển đổi
import 'package:app/theme.dart';
import 'package:flutter/material.dart';

class TableList extends StatelessWidget {
  const TableList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Table Order'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppTheme.primaryColor,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          onTap: (int index) {
            switch (index) {
              case 0:
                // Nhấn Home
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TableList()));
                break;

              case 1:
                // Nhấn Order
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TableList()));
                break;

              case 2:
                // Nhấn Payment
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OrderDetails()));
                break;

              case 3:
                // Nhấn Profile
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TableList()));
                break;
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.table_restaurant_outlined,
                color: AppTheme.primaryColor,
              ),
              label: 'Table',
            ),
            BottomNavigationBarItem(
                icon: const Icon(
                  Icons.checklist_rounded,
                  color: AppTheme.primaryColor,
                ),
                label: 'Order'),
            BottomNavigationBarItem(
                icon: const Icon(
                  Icons.payment_rounded,
                  color: AppTheme.primaryColor,
                ),
                label: 'Payment'),
            BottomNavigationBarItem(
                icon: const Icon(
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
              child: GridView.count(
                crossAxisCount: 3,
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                children: List.generate(12, (index) {
                  return Center(
                    child: GestureDetector(
                        onTap: () {
                          // Chuyển đổi sang màn hình ProductListScreen khi nhấn vào ô GridView
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductList(),
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
                            color: Color(0xFF42A5F5),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.table_bar_outlined,
                                color: AppTheme.whiteColor,
                                size: 28,
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Table ${index + 1}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        )),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
