import 'dart:developer';

import 'package:flutter/cupertino.dart';

import 'cartButton.dart';
import 'Counter.dart';

class ItemRow extends StatelessWidget {
  final String medicine_name;
  const ItemRow({
    Key? key,required this.medicine_name
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:  [
        Padding(
          padding: EdgeInsets.all(20),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                medicine_name,
                style: const TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 20
                ),
              )
          ),

        ),

        Counter(),
        const Align(
            alignment: Alignment.center,
            child: Text('₹42')
        ),

      ],
    );
  }
}

