import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmeasy/cart_page/CartPage.dart';
import 'package:pharmeasy/cart_page/components/Counter.dart';
import 'package:pharmeasy/cart_page/components/ItemRow.dart';
import 'package:pharmeasy/models/medicines.dart';
import 'package:pharmeasy/models/requests.dart';

import 'package:pharmeasy/home/request.dart';
import 'package:pharmeasy/home/stock/stock.dart';
import 'package:pharmeasy/home/stock/stock_empty.dart';
import 'package:pharmeasy/home/stock/stock_notempty.dart';

import '../collections.dart';
import 'home_row.dart';

// ignore: must_be_immutable, prefer_const_constructors, prefer_const_constructors
class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> medicinesnames=<String>[];

  final  TextEditingController medicineController = TextEditingController();

  final  TextEditingController stockController = TextEditingController();
  final  TextEditingController priceController = TextEditingController();
  final List<int> stockCount=<int>[];
  final List<double> price=<double>[];
  final List<int> quantity=<int>[];

  void addItemToList() async{

    setState(()  {

      quantity.add( 0);
      medicinesnames.add(medicineController.text);
      stockCount.add(int.parse(stockController.text));
      price.add(double.parse(priceController.text));

    });
    Medicines med=Medicines(id: medicineController.text, name: medicineController.text, qty: int.parse(stockController.text), maxqty: 100, price: double.parse(priceController.text));
    await Collections.medicinesRef.doc(med.id).set(med);
  }

  String getCurrentDate() {
    var date = DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.day}/${dateParse.month}/${dateParse.year}";
    return formattedDate.toString();
  }



  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Hi Jomi",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Roboto",
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Date",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.normal,
                              fontFamily: "Roboto",
                            ),
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0xFF7D97F3),
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  getCurrentDate(),
                                  style: const TextStyle(fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                              ))
                        ],
                      )
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(
                            child: Container(
                              width: 300,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: const Color(0xFF7D97F3),
                                  ),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: TextField(
                                  decoration: InputDecoration(
                                      prefixIcon: const Icon(Icons.search),
                                      suffixIcon: IconButton(
                                        icon: const Icon(Icons.clear),
                                        onPressed: () {
                                          /* Clear the search field */
                                        },
                                      ),
                                      hintText: 'Search...',
                                      border: InputBorder.none),
                                ),
                              ),
                            ),
                          ),
                         IconButton(
                             onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>CartPage()
                                        ),
                                );
                              }, icon: Icon(Icons.add_shopping_cart,color:Color(0xFFFF8080)))
                        ],
                      ),
                    ),
                  ),

                  Expanded(
                    child: ListView.builder(

                      padding: const EdgeInsets.all(8),
                      itemCount: medicinesnames.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Home_Row(
                          price:price[index],
                          medicinetxt: medicinesnames[index],
                          todo:stockCount[index]==0?const Request(): Counter(initQuantity:quantity[index],name:medicinesnames[index],price:price[index]),
                          stock_box: Stock_Count(
                              stock: stockCount[index]==0? stock_empty(): stock_notempty( stockno: stockCount[index],),
                              stock_bordercolor:stockCount[index]==0? const Color(0xFFFF928E):const Color(0xFF7D97F3)),
                        );
                        },),)
                ],
              ),
            ),
          ),
        ),
    floatingActionButton: FloatingActionButton(
        onPressed: () {

          showDialog(
            context: context,
            builder: (ctx) => SingleChildScrollView(
              child: AlertDialog(
                title: const Text("Alert Dialog Box",style: TextStyle(fontSize: 25),),
                content:Container(
                  height: 500,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      // PopUp_field(txt: "Name of medicine",popUpController: medicineController),
                      // PopUp_field(txt: "Stock Count",popUpController: stockController),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          Text(
                            " Name of medicine ",
                            style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20),
                          ),
                          TextField(
                            controller: medicineController,
                            style: const TextStyle(
                              fontSize: 15,

                            ),


                          ),

                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          Text(
                            " Stock Count ",
                            style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20),
                          ),
                          TextField(
                            controller: stockController,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                              fontSize: 15,

                            ),


                          ),

                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          Text(
                            " Price of medicine ",
                            style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20),
                          ),
                          TextField(
                            controller: priceController,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                              fontSize: 15,

                            ),


                          ),

                        ],
                      )
                    ],
                  ),
                ),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      addItemToList();
                      Navigator.of(ctx).pop();
                    },
                    child: Text("okay"),
                  ),
                ],
              ),
            ),
          );
        },
        child: const Text(
          "+",
          style: TextStyle(fontSize: 30),
        )),

      );
}
