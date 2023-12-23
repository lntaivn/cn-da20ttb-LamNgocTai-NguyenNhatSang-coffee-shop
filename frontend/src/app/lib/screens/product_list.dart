import 'package:app/components/categories.dart';
import 'package:app/components/product_card.dart';
import 'package:app/screens/order_details.dart';
import 'package:app/screens/table_list.dart';
import 'package:app/theme.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              child: Text(
                'Coffee Shop',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                ),
              )),
          const SearchBar(),
          Row(
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  child: Text(
                    'Categories',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  )),
            ],
          ),
          const Categories(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: 6,
                itemBuilder: (context, index) => ProductCard(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
