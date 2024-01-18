import 'package:app/screens/cart_page.dart';
import 'package:app/screens/invoice_list.dart';
import 'package:app/screens/table_list.dart';
import 'package:app/theme.dart';
import 'package:flutter/material.dart';

class BottonNavBar extends StatelessWidget {
  const BottonNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
                MaterialPageRoute(builder: (context) => const InvoiceList()));
            break;

          case 2:
            // Nhấn Payment
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CartPage()));
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
            label: 'Invoice'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: AppTheme.primaryColor,
            ),
            label: 'Cart'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person_2_outlined,
              color: AppTheme.primaryColor,
            ),
            label: 'Profile'),
      ],
    );
  }
}
