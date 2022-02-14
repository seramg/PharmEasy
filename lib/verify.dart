import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmeasy/button.dart';
import 'package:pharmeasy/home/home.dart';

class Verify extends StatefulWidget {

  final TextEditingController? phone;

   Verify({Key? key, this.phone}) : super(key: key);

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController otpCode = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child:  Image.asset("assets/images/verify.png",)),
                ),
                const Center(child: Text('Verify Yourself',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),)),
                const Center(child: Text('We have sent a One Time Password to your regisetered mobile number.',
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal),textAlign:  TextAlign.center)),
                Center(child: Text(widget.phone!.text,
                    style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),textAlign:  TextAlign.center)),
                Center(
                  child: Container(

                    width: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                      children: [
                        Container(

                          decoration: const BoxDecoration(
                              color: Color(0xFFBDC3F5),
                              shape: BoxShape.circle
                          ),
                          child: const Padding( padding: EdgeInsets.all(16.0),child: const Text('X',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                        ),
                        Container(

                          decoration: const BoxDecoration(
                              color: Color(0xFFBDC3F5),
                              shape: BoxShape.circle
                          ),
                          child: const Padding( padding: EdgeInsets.all(16.0),child: const Text('X',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                        ),
                        Container(

                          decoration: const BoxDecoration(
                              color: Color(0xFFBDC3F5),
                              shape: BoxShape.circle
                          ),
                          child: const Padding( padding: EdgeInsets.all(16.0),child: const Text('X',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                        ),
                        Container(

                          decoration: const BoxDecoration(
                              color: Color(0xFFBDC3F5),
                              shape: BoxShape.circle
                          ),
                          child: const Padding( padding: EdgeInsets.all(16.0),child: Text('X',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                        ),
                      ],
                    ),
                  ),
                ),
                 Button(btntxt: 'SUBMIT',
                  onClick:() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Home()),
                  );
                },)
              ],
            ),
          ),
        ) ,
      )
      );
  }
}
