
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cart_page/constants.dart';


class Field extends StatelessWidget {
Function? Checker;
bool? emailValid;
bool? empty;
  TextEditingController controller;
  String text;
  Field({
    Key? key, required this.text, required this.controller,this.Checker, this.emailValid, this.empty
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          Text(
            text,
            style:  const TextStyle(
              fontSize: 20,

              fontWeight: FontWeight.bold,
              fontFamily: "Roboto",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child:  SizedBox(
              height: 80,
              child:
              TextField(
                controller: controller,
                onChanged: (value) {

                },
                decoration:InputDecoration(
                  errorText: empty! ? 'Please enter the value ' : null,


                    fillColor: Colors.white,
                    border:  OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey,width: 2.0),
                      borderRadius:  BorderRadius.circular(10.0),

                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF7D97F3),width: 2.0),
                        borderRadius:  BorderRadius.circular(10.0)
                    )
                ),

                  style: const TextStyle(
                    fontSize: 15,

                  ),


                )

            ),
            ),

        ],
      ),
    );
  }
}
