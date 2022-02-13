import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pharmeasy/verify.dart';
import 'package:pharmeasy/welcomeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // firestore.collection("Users").add({
  //   "name": "sera",
  //   "phoneno":"1234"
  // });
  final docs = await firestore.collection("Users").where("name",isEqualTo: "sera").get();
  final data= docs.docs[0].data();
  print(data);
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      home: Scaffold(body: WelcomeScreen()),
    );
  }
}
