import 'dart:convert';
import 'dart:developer';

import 'package:api/utils/global.dart';
import 'package:api/utils/helper/apihelper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  // Declare a List<Product> to hold the products added to the cart
  List finalProduct = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'cart');
            },
            icon: Icon(Icons.add_shopping_cart),
          ),
        ],
      ),
      body: FutureBuilder(
        future: ApiHelper.apiHelper.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(
                      snapshot.data![index].title,
                    ),
                    leading: IconButton(
                      onPressed: () async {
                        // Use a single Product instead of a List
                        finalProduct.add(allProdyct[index]);

                        // Add the product to the list

                        // Store the list of products as JSON
                        String productJson = jsonEncode(finalProduct);
                        log(productJson);

                        final SharedPreferences data =
                            await SharedPreferences.getInstance();
                        data.setString('cart', productJson);
                      },
                      icon: Icon(Icons.add),
                    ),
                  ),
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
