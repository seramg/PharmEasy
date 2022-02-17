
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Counter.dart';

class ItemRow extends StatelessWidget {
  final String medicineName;
  final double price;
  const ItemRow({
    Key? key,required this.medicineName,required this.price
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:  [
        Text(
          medicineName,
          style: const TextStyle(
              fontStyle: FontStyle.normal,
              fontSize: 20
          ),
        ),

        Row(
          children: [
             // Counter( initQuantity: ),
            Text(price.toString()),
          ],
        ),


      ],
    );
  }
}

