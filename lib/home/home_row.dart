
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../cart_page/components/Counter.dart';
class Home_Row extends StatelessWidget {
  Widget stock_box;
  Widget todo;
  String medicinetxt;
 final double price;
   Home_Row({
    Key? key,required this.stock_box,required this.todo,required this.medicinetxt,required this.price
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         stock_box,
          Column(
            children: [
              Text(medicinetxt,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 25),),
              Text("1 strip | "+price.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Color(0xFF7D97F3)),),
            ],
          ),
          todo
        ],
      ),
    );
  }
}
