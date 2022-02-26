import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pharmeasy/cart_page/components/PriceDetails.dart';
import 'package:pharmeasy/models/medicinesShort.dart';
import 'package:pharmeasy/models/orders.dart';
import 'package:pharmeasy/collections.dart';
import 'components/ItemRow.dart';
import '../button.dart';

class CartPage extends StatefulWidget {
  // final List<int> stockCountselected;
  // final List<double> priceselected;
  // final List<int> quantityselected;
  // final List<String> medicinesnamesselected;

  CartPage({
    Key? key,
    //required this.medicinesnamesselected,required this.priceselected,required this.quantityselected,required this.stockCountselected
  }) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<MedicinesShort> medshortlist = [];
  double total = 0;



  Future<List<MedicinesShort>> orders_get1() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    total = 0;
    await firestore
        .collection('medicinesShort')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc.data());
        MedicinesShort medicinesShort =
            MedicinesShort.fromJson(doc.data() as Map<String, dynamic>);
        medshortlist.add(medicinesShort);

        total += (medicinesShort.price) * (medicinesShort.qty.toDouble());
      });
    });

    Orders order =
        Orders(med: medshortlist, total: total, id: medshortlist[0].name);
    Collections.ordersRef.doc(order.id).set(order);
    print(total);

    print(medshortlist);

    return medshortlist;
    // Orders order =
    // Orders(med: medshortlist, total: total, id: medshortlist[0].name);
    // Collections.ordersRef.doc(order.id).set(order);

    //   return medshortlist;
    // }

// List<MedicinesShort>  setinit() async{
//     List<MedicinesShort>  medshort_firebase=[];
//     medshort_firebase=await orders_get();
//
//     return medshort_firebase;
//   }
  }

  @override
  Widget build(BuildContext context) {
    // medshortlist=orders_get1();
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: orders_get1(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/images/image2.png'),
                      SizedBox(
                        height: 250,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: medshortlist.length,
                          itemBuilder: (context, index) => ItemRow(
                              medicineName: medshortlist[index].name,
                              price: medshortlist[index].price),
                        ),
                      ),
                      PriceDetails(
                          priceValueCategory: 'Item Total', total: total),

                       PriceDetails(
                        priceValueCategory: 'To Pay',
                        total: total,
                      ),
                      Button(
                        btntxt: "Checkout",
                        onClick: () {

                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                );
              }
            }),
      ),
    );
  }
}
