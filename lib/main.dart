import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'cart_page/CartPage.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      home: CartPage(),
    );
  }
}
