
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Request extends StatelessWidget {
  const Request({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      onPressed: () {

      },
      child:  const Text(
        "Request",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20),
      ),
      style: ButtonStyle(

        padding:MaterialStateProperty.all(
            const EdgeInsets.all(8.0)),
        backgroundColor:
        MaterialStateProperty.all(const Color(0xFFFF8080)),
        shape:
        MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)),
        ),
      ),
    );
  }
}
