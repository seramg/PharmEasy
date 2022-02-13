import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable, prefer_const_constructors, prefer_const_constructors
class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
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
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
