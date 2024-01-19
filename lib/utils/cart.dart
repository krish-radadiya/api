import 'package:api/utils/global.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount:
            allProdyct.length, // Assuming allProduct is your list of products
        itemBuilder: (context, index) {
          final product = allProdyct[index];
          return ListTile(
            title: Text(product['title']),
            // Add more UI elements as needed for your cart items
          );
        },
      ),
    );
  }
}
