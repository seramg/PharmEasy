import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmeasy/models/medicinesShort.dart';
import 'package:pharmeasy/models/orders.dart';

import '../../collections.dart';
import 'cartButton.dart';

class Counter extends StatefulWidget {

final int initQuantity;
final String name;
final double price;
 const Counter({
    Key? key,required this.initQuantity,required this.name,required this.price
  }) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  // Medicines med=Medicines(id: medicineController.text, name: medicineController.text, qty: int.parse(stockController.text), maxqty: 100, price: double.parse(priceController.text));
  // await Collections.medicinesRef.doc(med.id).set(med);


  late int quantity;
     List<MedicinesShort>  med=[];
  double total=0;

@override
  void initState() {
   quantity=widget.initQuantity;

    super.initState();
  }
  void increment(){
    setState((){

      quantity++;

      MedicinesShort medshort=MedicinesShort(qty: quantity,name: widget.name,price: widget.price,id: widget.name );
      Collections.medicinesShortRef.doc(medshort.id).set(medshort);

      if(quantity<=0) {
        Collections.medicinesShortRef.doc(medshort.id).delete();
      }
      // med=;
      // total=total+medshort.price!;
      // Orders order=Orders(id: medshort.name, med: med, total: total);
      // Collections.ordersRef.doc(order.id).set(order);
    });

  }
  void decrement(){
    setState(() {

      quantity--;

      MedicinesShort medshort = MedicinesShort(
          qty: quantity,
          name: widget.name,
          price: widget.price,
          id: widget.name);
      Collections.medicinesShortRef.doc(medshort.id).set(medshort);
      if(quantity<=0) {
        Collections.medicinesShortRef.doc(medshort.id).delete();
      }
      // Orders order=Orders();
      // var x = await Collections.ordersRef.add(order);
      // order.id = x.id;
      // if()
      // med.add(medshort);
      // total=total+medshort.price!;
      //
      // Collections.ordersRef.doc(order.id).set(order);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        cartButton(sign: '-',operation:decrement),

        Text(
          quantity.toString(),
        ),

        cartButton(sign: '+',operation:increment),

      ],
    );
  }
}

