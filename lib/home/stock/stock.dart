
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Stock_Count extends StatelessWidget {
  Widget stock;
  Color stock_bordercolor;
   Stock_Count({
    Key? key, required this.stock,required this.stock_bordercolor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFF5F5),
          border: Border.all(
            width: 4,
            color: stock_bordercolor,
          ),

          shape: BoxShape.circle,
        ),
        child:  Padding(
          padding: const EdgeInsets.all(16.0),
          child:stock
        ));
  }
}
