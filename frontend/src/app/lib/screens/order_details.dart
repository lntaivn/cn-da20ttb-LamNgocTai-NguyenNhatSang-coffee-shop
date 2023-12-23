import 'package:app/screens/table_list.dart';
import 'package:app/theme.dart';
import 'package:flutter/material.dart';

class OrderDetails extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems = [
    {
      'title': 'Cappuccino',
      'size': 'large',
      'price': 14,
      'image':
          'https://media.istockphoto.com/photos/cup-of-cafe-latte-with-coffee-beans-and-cinnamon-sticks-picture-id505168330?b=1&k=20&m=505168330&s=170667a&w=0&h=jJTePtpYZLR3M2OULX5yoARW7deTuAUlwpAoS4OriJg='
    },
    {
      'title': 'Espresso',
      'size': 'large',
      'price': 10,
      'image':
          'https://media.istockphoto.com/photos/cup-of-cafe-latte-with-coffee-beans-and-cinnamon-sticks-picture-id505168330?b=1&k=20&m=505168330&s=170667a&w=0&h=jJTePtpYZLR3M2OULX5yoARW7deTuAUlwpAoS4OriJg='
    },
    {
      'title': 'Mocaccino',
      'size': 'large',
      'price': 20,
      'image':
          'https://media.istockphoto.com/photos/cup-of-cafe-latte-with-coffee-beans-and-cinnamon-sticks-picture-id505168330?b=1&k=20&m=505168330&s=170667a&w=0&h=jJTePtpYZLR3M2OULX5yoARW7deTuAUlwpAoS4OriJg='
    },
    {
      'title': 'Mocaccino',
      'size': 'large',
      'price': 20,
      'image':
          'https://media.istockphoto.com/photos/cup-of-cafe-latte-with-coffee-beans-and-cinnamon-sticks-picture-id505168330?b=1&k=20&m=505168330&s=170667a&w=0&h=jJTePtpYZLR3M2OULX5yoARW7deTuAUlwpAoS4OriJg='
    },
    {
      'title': 'Mocaccino',
      'size': 'large',
      'price': 20,
      'image':
          'https://media.istockphoto.com/photos/cup-of-cafe-latte-with-coffee-beans-and-cinnamon-sticks-picture-id505168330?b=1&k=20&m=505168330&s=170667a&w=0&h=jJTePtpYZLR3M2OULX5yoARW7deTuAUlwpAoS4OriJg='
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back action
          },
        ),
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
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Card(
                    elevation:
                        4, // Adjust this value for desired shadow intensity
                    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10), // Adjust the border radius for desired card shape
                    ),
                    child: ListTile(
                      leading: Image.network(
                          item['image']), // Replace with actual image path
                      title: Text(item['title']),
                      subtitle: Text('\$${item['price']}'),
                      trailing: Container(
                        width:
                            140, // Set a fixed width for the trailing container
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            // Minus button
                            IconButton(
                              icon: Icon(
                                Icons.remove,
                                color: AppTheme.primaryColor,
                              ),
                              onPressed: () {
                                // Decrease the item quantity
                              },
                            ),
                            // Quantity text
                            Text(
                              '1', // Replace with the item quantity variable
                              textAlign: TextAlign.center,
                            ),
                            // Plus button
                            IconButton(
                              icon: Icon(
                                Icons.add,
                                color: AppTheme.primaryColor,
                              ),
                              onPressed: () {
                                // Increase the item quantity
                              },
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        // Handle the tap if necessary
                      },
                      // Add your plus and minus buttons here
                    ));
              },
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Subtotal'),
                    Text('\$42.00'), // Calculate this value based on cart items
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Shipping'),
                    Text('\$4.00'), // This could be a flat rate or calculated
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Tax (3%)'),
                    Text('\$2.00'), // Calculate this value based on subtotal
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('\$48.00',
                        style: TextStyle(
                            fontWeight:
                                FontWeight.bold)), // Calculate this value
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              child: Text('Continue To Payment'),
              onPressed: () {
                // Handle payment action
              },
            ),
          ),
        ],
      ),
    );
  }
}
