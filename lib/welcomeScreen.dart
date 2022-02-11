import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'Field.dart';
import 'button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
    child: SingleChildScrollView(
      child: Container(
        color:Colors.white,
          child: Padding(

            padding: const EdgeInsets.all(16.0),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const[

                    Text(
                     "Welcome to ",
                      style:  TextStyle(
                       fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Roboto",
                      ),
               ),
                    Text(
                      "Pharm",
                      style:  TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Roboto",
                        color: Color(0xFF7D97F3)
                      ),
                    ),
                    Text(
                      "Easy",
                      style:  TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Roboto",
                          color: Color(0xFFFEBBBA)
                      ),
                    ),
                  ],
                ),

               Padding(
                 padding: const EdgeInsets.all(16.0),
                 child: Center(
                     child: Image.asset("assets/images/img1.png")
                 ),
               ),
                 Padding(
                   padding: const EdgeInsets.all(16.0),
                   child: Column(
                     children: [
                       Field(text:"Name"),
                       Field(text:"Email ID"),
                       Field(text:"Phone No:"),
                       Field(text:"Medical Store"),
                     ],
                   ),
                 ),
                Button(btntxt:"Register")
              ],
            ),
          ),
        ),
    ),
  );
}
