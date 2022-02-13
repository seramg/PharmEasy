import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class cartButton extends StatelessWidget {
  final String sign;
  final Function operation;
  const cartButton({
    Key? key,required this.sign,required this.operation
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      operation();
    },
        child: Text(
          sign,
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
    );
  }
}