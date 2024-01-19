import 'dart:convert';
import 'dart:developer';

import 'package:api/homepage.dart';
import 'package:api/utils/cart.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const homepage(),
        'cart': (context) => const CartPage(),
      },
    ),
  );
  getStoredData();
}

void getStoredData() async {
  final SharedPreferences data = await SharedPreferences.getInstance();

  // Retrieve the stored JSON string from the 'cart' key
  String? storedJson = data.getString('cart');

  // Check if the string is not null and then you can use it as needed
  if (storedJson != null) {
    Map<String, dynamic> parsedJson = jsonDecode(storedJson);

    // Do something with the parsed JSON data
    log("Parsed JSON: $parsedJson");
  }
}
