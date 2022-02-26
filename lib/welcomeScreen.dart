import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:pharmeasy/models/medicalstore.dart';
import 'package:pharmeasy/verify.dart';

import 'Field.dart';
import 'button.dart';
import 'cart_page/constants.dart';
import 'collections.dart';
import 'models/user.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  TextEditingController nameController = TextEditingController();

  TextEditingController emailIdController = TextEditingController();

  TextEditingController phoneNoController = TextEditingController();

  TextEditingController medStoreController = TextEditingController();
  bool _nameempty = false;bool _medStoreempty = false;bool _emailempty = false;bool _phoneNoempty = false;
  bool _emailvalid = true;
  String errorMsg = '';

  void onClick() async {

    // MedicalStore medStore= MedicalStore(id: id, name: name)
    // User user = User(id: id, name: nameController.text, phone: phoneNoController.text, email: emailIdController.text, medStore: medStoreController.text)
    // var x= await firestore.collection("MedicalStore").add(medStore.toJson());


    MedicalStore medStore = MedicalStore(name: medStoreController.text);
    var x = await Collections.medicalStoreRef.add(medStore);
    medStore.id = x.id;
    await Collections.medicalStoreRef.doc(x.id).set(medStore);
    User user = User(
        id: emailIdController.text,
        name: nameController.text,
        phone: phoneNoController.text,
        email: emailIdController.text,
        medStore: medStore);
    await Collections.usersRef.doc(user.id).set(user);

  }
  bool error=true;
  bool Checker(TextEditingController controller,bool _empty) {
    setState(() {
     _empty = false;

      if (controller.text.isEmpty) {

        _empty = true;
      } else {
        _empty = false;

      }

    });
    return _empty;
  }
  bool emailValidator(TextEditingController controller,bool _valid) {
    setState(() {
   _valid  = true;

      if (controller.text.contains('@gmail.com')) {

        _valid =true;
      } else {
        _valid =false;

      }
    });
    return _valid;
  }
  Future<bool> onClickLogin(BuildContext context) async {
    error=true;
    if (emailIdController.text.isEmpty || phoneNoController.text.isEmpty||medStoreController.text.isEmpty||nameController.text.isEmpty) {
      error =true;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('All fields need to be entered')));
    }
    else if (!_emailvalid) {
      error=true;
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('There is an error.Please check what you have entered')));
    }
    else
      {
        error=false;
      }
    print(error);
    return error;
    }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Welcome to ",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Roboto",
                          ),
                        ),
                        Text(
                          "Pharm",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Roboto",
                              color: Color(0xFF7D97F3)),
                        ),
                        Text(
                          "Easy",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Roboto",
                              color: Color(0xFFFEBBBA)),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(child: Image.asset("assets/images/img1.png")),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                      Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          const Text(
                            'Name',
                            style:  TextStyle(
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
                                  controller: nameController,
                                  onChanged: (value) {
                                   _nameempty= Checker(nameController,_nameempty);
                                  },
                                  decoration:InputDecoration(
                                      errorText: _nameempty?'Fields cant be empty' :null,


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
                    ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                const Text(
                                  'Email ID',
                                  style:  TextStyle(
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
                                        controller: emailIdController,
                                        onChanged: (value) {
                                          _emailempty=  Checker(emailIdController,_emailempty);

                                          _emailvalid=emailValidator(emailIdController,_emailvalid);


                                        },
                                        decoration:InputDecoration(
                                            errorText: _emailempty?'Fields cant be empty' :
                                            (_emailvalid?null :'Enter a valid mail'),
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
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                const Text(
                                  'Phone No',
                                  style:  TextStyle(
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
                                        controller: phoneNoController,
                                        onChanged: (value) {
                                          _phoneNoempty=  Checker(phoneNoController,_phoneNoempty);
                                        },
                                        decoration:InputDecoration(
                                            errorText: _phoneNoempty?'Fields cant be empty' :null,


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
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                const Text(
                                  'Medical Store Name',
                                  style:  TextStyle(
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
                                        controller: medStoreController,
                                        onChanged: (value) {
                                          _medStoreempty=  Checker(medStoreController,_medStoreempty);
                                        },
                                        decoration:InputDecoration(
                                            errorText: _medStoreempty?'Fields cant be empty' :null,


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
                          ),
                        ],
                      ),
                    ),
                    Button(
                        btntxt: "Register",
                        onClick: () async {
                          onClick();
                          bool condn=await onClickLogin(context);
                          if(!condn) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  Verify(phone: phoneNoController)),
                            );
                          }
                        }
                      )
                  ],
                ),
              ),
            ),
          ),
        ),
  );
}
