import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmeasy/models/medicinesShort.dart';

import '../../collections.dart';
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
        ElevatedButton(onPressed: (){
         decrement();
         quantity_change();
        },
            child: Text(
              "-",
              style: const TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 10,
                  color: Colors.black
              ),
            ),
            style: ButtonStyle(
              backgroundColor:
              MaterialStateProperty.all(const Color(0xFF7D97F3)),
              shape:  MaterialStateProperty.all<CircleBorder>(
                const CircleBorder(
                ),

              ),
            )
        ),

        Text(          quantity.toString(),
        ),

        ElevatedButton(onPressed: (){
          increment();
          quantity_change();
        },
            child: Text(
              "+",
              style: const TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 10,
                  color: Colors.black
              ),
            ),
            style: ButtonStyle(
              backgroundColor:
              MaterialStateProperty.all(const Color(0xFF7D97F3)),
              shape:  MaterialStateProperty.all<CircleBorder>(
                const CircleBorder(
                ),

              ),
            )
        ),

      ],
    );
  }
}

