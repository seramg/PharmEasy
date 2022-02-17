import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pharmeasy/cart_page/components/PriceDetails.dart';
import 'package:pharmeasy/models/medicinesShort.dart';
import 'package:pharmeasy/models/orders.dart';
import 'package:pharmeasy/collections.dart';
import 'components/ItemRow.dart';
import '../button.dart';

class CartPage extends StatelessWidget {
  // final List<int> stockCountselected;
  // final List<double> priceselected;
  // final List<int> quantityselected;
  // final List<String> medicinesnamesselected;

   CartPage({Key? key,
     //required this.medicinesnamesselected,required this.priceselected,required this.quantityselected,required this.stockCountselected
   }) : super(key: key);
   List<MedicinesShort> medshortlist=[];

  Future<List<MedicinesShort>> orders_get() async
{
  FirebaseFirestore firestore = FirebaseFirestore.instance;


  double total = 0;
  await firestore.collection('medicinesShort').get().then((
      QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      // medshortlist.add(doc.data());
      //   print(doc.data());
      //   doc.data().
      MedicinesShort medicinesShort = MedicinesShort.fromJson(
          doc.data() as Map<String, dynamic>);
      medshortlist.add(medicinesShort);
      total += (medicinesShort.price!) * (medicinesShort.qty.toDouble());
    });
  });

  Orders order = Orders(
      med: medshortlist, total: total, id: medshortlist[0].name);
  Collections.ordersRef.doc(order.id).set(order);
  return medshortlist;
}
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/image2.png'),

              SizedBox(
                height: 250,
                child: FutureBuilder(
                  future: orders_get(),
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

                    if(!snapshot.hasData) {

                        return Center(child: CircularProgressIndicator());
                      }
                    else
                      {
                        return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount:snapshot.data.length,
                          itemBuilder: (context, index) =>
                              ItemRow(medicineName:snapshot.data[index].name,price: snapshot.data[index].price));
                      }
                    },
                )
              ),
              //const SizedBox(height: 150),

              const PriceDetails(
                priceValueCategory: 'Item Total',
              ),
              const PriceDetails(
                priceValueCategory: 'Discount',
              ),
              const PriceDetails(
                priceValueCategory: 'To Pay'
              ),

               Button(
                btntxt: "Checkout",
                onClick:() {

                  Navigator.pop(context);
                },

              )
            ],
          ),
        ),
      ),
    );
  }
}
