import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'Field.dart';
import 'button.dart';

class WelcomeScreen extends StatefulWidget {

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  TextEditingController nameController=TextEditingController();

  TextEditingController emailIdController=TextEditingController();

  TextEditingController phoneNoController=TextEditingController();

  TextEditingController medStoreController=TextEditingController();
void onClick()
{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  firestore.collection("Users").add({
   "name":nameController.text,
    "emailId":emailIdController.text,
    "phoneNo":phoneNoController.text,
    "medStore":medStoreController.text
  });

}
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
                       Field(text:"Name",controller: nameController,),
                       Field(text:"Email ID",controller: emailIdController,),
                       Field(text:"Phone No:",controller: phoneNoController,),
                       Field(text:"Medical Store",controller: medStoreController,),
                     ],
                   ),
                 ),
                Button(btntxt:"Register",onClick:onClick)
              ],
            ),
          ),
        ),
    ),
  );
}
