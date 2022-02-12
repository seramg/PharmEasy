import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cartButton.dart';

class Counter extends StatefulWidget {


  Counter({
    Key? key,
  }) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int quantity=0;
  void increment(){
    setState((){
      quantity++;
    });

  }
  void decrement(){
    setState((){
      quantity--;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
       cartButton(sign: '-',operation:decrement),

        Text(
          quantity.toString(),
        ),

        cartButton(sign: '+',operation:increment),

      ],
    );
  }
}

