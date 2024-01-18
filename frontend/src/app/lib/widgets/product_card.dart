import 'package:app/models/product_model.dart';
import 'package:app/theme.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final ProductModels product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 8,
              offset: const Offset(3, 5),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        width: MediaQuery.of(context).size.width / 2 - 24,
        padding: const EdgeInsets.all(4),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(4),
                  height: MediaQuery.of(context).size.width / 2 - 64,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(product.imageUrl))),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 4),
                  child: Text(
                    product.productName,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const Positioned(
                bottom: 8,
                right: 8,
                child: CircleAvatar(
                    backgroundColor: AppTheme.primaryColor,
                    child: Icon(Icons.add))),
            Positioned(
                top: 14,
                right: 14,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppTheme.secondaryColor.withOpacity(.8),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.monetization_on_outlined,
                          color: Colors.white),
                      Text(
                        '${product.price}',
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
