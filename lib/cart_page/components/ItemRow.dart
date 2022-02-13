
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Counter.dart';

class ItemRow extends StatelessWidget {
  final String medicineName;
  const ItemRow({
    Key? key,required this.medicineName
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
            Counter(),
            Text('₹42'),
          ],
        ),


      ],
    );
  }
}

