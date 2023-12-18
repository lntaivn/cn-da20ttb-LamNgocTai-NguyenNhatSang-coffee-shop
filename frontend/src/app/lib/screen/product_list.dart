import 'package:flutter/material.dart';

class CartProduct extends StatelessWidget {
  const CartProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coffee Shop'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Phần header menu
            MenuHeader(),
            // List sản phẩm
            Expanded(
              child: CoffeeList(),
            ),
            // Phần thanh toán
            CheckoutSection(),
          ],
        ),
      ),
    );
  }
}

class MenuHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Cafe',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        Text('Trà', style: TextStyle(fontSize: 24)),
        Text('Sinh tố', style: TextStyle(fontSize: 24)),
        Text('Nước ngọt', style: TextStyle(fontSize: 24)),
      ],
    );
  }
}

class CoffeeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CoffeeItem(
            name: 'Cafe Sữa',
            price: '20 000',
            imgPath: 'assets/coffee_milk.png'),
        CoffeeItem(
            name: 'Cafe Đen',
            price: '20 000',
            imgPath: 'assets/black_coffee.png'),
        // Thêm các sản phẩm khác tương tự...
      ],
    );
  }
}

class CoffeeItem extends StatelessWidget {
  final String name;
  final String price;
  final String imgPath;

  const CoffeeItem(
      {Key? key,
      required this.name,
      required this.price,
      required this.imgPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(imgPath), // Đường dẫn đến hình ảnh sản phẩm
      title: Text(name),
      trailing: Text(price),
    );
  }
}

class CheckoutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Thành tiền: 100 000đ', style: TextStyle(fontSize: 20)),
        ElevatedButton(
          onPressed: () {
            // Xử lý khi nhấn nút
          },
          child: Text('Tiếp', style: TextStyle(fontSize: 20)),
        ),
      ],
    );
  }
}
