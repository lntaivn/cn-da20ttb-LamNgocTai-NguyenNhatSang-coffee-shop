import 'package:flutter/material.dart';

class TableOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Table Order Management'),
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [Text('Oder Number: 10')],
                  ),
                  Column(
                    children: [Text('Empty Table: 00')],
                  )
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(12, (index) {
                  return Center(
                      child: Column(children: [
                    Text('Table ${index + 1}'),
                    InkWell(
                        child: Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xFF42A5F5)),
                    ))
                  ]));
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: orderButton,
                    child: const Text('Order'),
                  ),
                  ElevatedButton(
                    onPressed: tableButton,
                    child: const Text('Table'),
                  ),
                  ElevatedButton(
                    onPressed: paymentButton,
                    child: const Text('Payment'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void orderButton() {
    // Add the functionality for the order button here
  }

  void tableButton() {
    // Add the functionality for the table button here
  }

  void paymentButton() {
    // Add the functionality for the payment button here
  }
}
