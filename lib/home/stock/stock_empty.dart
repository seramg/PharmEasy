

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class stock_empty extends StatelessWidget {
  const stock_empty({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.add_shopping_cart_outlined,color: Color(0xFFFF8080),size: 20,
    );
  }
}
