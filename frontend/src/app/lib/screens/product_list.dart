import 'package:app/controllers/product_controller.dart';
import 'package:app/models/product_model.dart';
import 'package:app/widgets/categories.dart';
import 'package:app/widgets/product_card.dart';
import 'package:app/screens/cart_page.dart';
import 'package:app/screens/table_list.dart';
import 'package:app/theme.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final ProductsController _productsController = ProductsController();

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
                  MaterialPageRoute(builder: (context) => const TableList()));
              break;

            case 1:
              // Nhấn Order
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const TableList()));
              break;

            case 2:
              // Nhấn Payment
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage()));
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
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              child: Text(
                'Coffee Shop',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                ),
              )),
          const SearchBar(),
          const Row(
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: FutureBuilder<List<ProductModels>>(
                future: _productsController.getProducts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No products available.'));
                  } else {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) => ProductCard(
                        product: snapshot.data![index],
                      ),
                    );
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
