import 'package:app/animation/FadeAnimation.dart';
import 'package:app/controllers/product_controller.dart';
import 'package:app/models/product_model.dart';
import 'package:app/screens/payment_success.dart';
// import 'package:app/screens/table_list.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> with TickerProviderStateMixin {
  late List<ProductModels> cartItems = [];
  List<int> cartItemCount = [1, 1, 1, 1];
  int totalPrice = 0;

  Future<void> fetchItems() async {
    try {
      ProductsController productsController = ProductsController();
      var items = await productsController.getProducts();

      // Giả sử bạn muốn sản phẩm với ID 1, 2, 3, 4
      List<int> selectedProductIds = [1, 2, 3, 4];
      var selectedItems = items
          .where((item) => selectedProductIds.contains(item.product_id))
          .toList();

      setState(() {
        cartItems = selectedItems;
        cartItemCount = List<int>.filled(cartItems.length, 1);
      });

      sumTotal();
    } catch (e) {
      print('Error fetching products: $e');
    }
  }

  sumTotal() {
    cartItems.forEach((item) {
      totalPrice = item.price + totalPrice;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchItems().whenComplete(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
// Tính tổng số lượng sản phẩm trong giỏ hàng
    int totalItems = cartItemCount.fold(0, (sum, item) => sum + item);

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('Cart Page', style: TextStyle(color: Colors.black)),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: MediaQuery.of(context).size.height * 0.53,
                child: cartItems.length > 0
                    ? FadeAnimation(
                        1.4,
                        AnimatedList(
                            scrollDirection: Axis.vertical,
                            initialItemCount: cartItems.length,
                            itemBuilder: (context, index, animation) {
                              return Slidable(
                                actionPane: const SlidableDrawerActionPane(),
                                secondaryActions: [
                                  MaterialButton(
                                    color: Colors.red.withOpacity(0.15),
                                    elevation: 0,
                                    height: 60,
                                    minWidth: 60,
                                    shape: const CircleBorder(),
                                    child: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                      size: 30,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        totalPrice = totalPrice -
                                            (int.parse(cartItems[index]
                                                    .price
                                                    .toString()) *
                                                cartItemCount[index]);

                                        AnimatedList.of(context).removeItem(
                                            index, (context, animation) {
                                          return cartItem(cartItems[index],
                                              index, animation);
                                        });

                                        cartItems.removeAt(index);
                                        cartItemCount.removeAt(index);
                                      });
                                    },
                                  ),
                                ],
                                child: cartItem(
                                    cartItems[index], index, animation),
                              );
                            }),
                      )
                    : Container(),
              ),
              const SizedBox(height: 30),
              FadeAnimation(
                1.2,
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text('Items', style: TextStyle(fontSize: 20)),
                      Text('$totalItems',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ),
              FadeAnimation(
                  1.3,
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: DottedBorder(
                        color: Colors.grey.shade400,
                        dashPattern: [10, 10],
                        padding: const EdgeInsets.all(0),
                        child: Container()),
                  )),
              FadeAnimation(
                  1.3,
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text('Total', style: TextStyle(fontSize: 20)),
                        Text('\$${totalPrice}',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold))
                      ],
                    ),
                  )),
              const SizedBox(height: 10),
              FadeAnimation(
                  1.4,
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PaymentSuccess()));
                      },
                      height: 50,
                      elevation: 0,
                      splashColor: Colors.yellow[700],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.yellow[800],
                      child: const Center(
                        child: Text(
                          "Checkout",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ))
            ]));
  }

  cartItem(ProductModels product, int index, animation) {
    return GestureDetector(
      child: SlideTransition(
        position: Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
            .animate(animation),
        child: Container(
          margin: const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                offset: const Offset(0, 2),
                blurRadius: 6,
              ),
            ],
          ),
          child: Row(children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  product.image_url,
                  fit: BoxFit.cover,
                  height: 100,
                  width: 100,
                ),
              ),
            ),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      product.name,
                      style: TextStyle(
                        color: Colors.orange.shade400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      '\$${product.price}',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ]),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MaterialButton(
                  minWidth: 10,
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    setState(() {
                      if (cartItemCount[index] > 1) {
                        cartItemCount[index]--;
                        totalPrice = totalPrice - product.price;
                      }
                    });
                  },
                  shape: const CircleBorder(),
                  child: Icon(
                    Icons.remove_circle_outline,
                    color: Colors.grey.shade400,
                    size: 30,
                  ),
                ),
                Container(
                  child: Center(
                    child: Text(
                      cartItemCount[index].toString(),
                      style:
                          TextStyle(fontSize: 20, color: Colors.grey.shade800),
                    ),
                  ),
                ),
                MaterialButton(
                  padding: const EdgeInsets.all(0),
                  minWidth: 10,
                  splashColor: Colors.yellow[700],
                  onPressed: () {
                    setState(() {
                      cartItemCount[index]++;
                      totalPrice = totalPrice + product.price;
                    });
                  },
                  shape: const CircleBorder(),
                  child: const Icon(
                    Icons.add_circle,
                    size: 30,
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
