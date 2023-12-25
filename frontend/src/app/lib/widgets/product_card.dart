import 'package:app/theme.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);

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
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://www.highlandscoffee.com.vn/vnt_upload/product/04_2023/New_product/HLC_New_logo_5.1_Products__LATTE_1.jpg'))),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0, bottom: 4),
                  child: Text(
                    'Cappaccino',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                  child: const Row(
                    children: [
                      Icon(Icons.monetization_on_outlined, color: Colors.white),
                      Text(
                        '20.000',
                        style: TextStyle(color: Colors.white),
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
