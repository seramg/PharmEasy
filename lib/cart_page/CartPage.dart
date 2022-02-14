import 'package:flutter/material.dart';
import 'package:pharmeasy/cart_page/components/PriceDetails.dart';

import 'components/ItemRow.dart';
import '../button.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const medicines = [
      "Dolo",
      "AVIL",
      "COconut",
      "one",
      "AVIL",
      "COconut",
      "Idk",
      "AVIL",
      "COconut",
      "home"
    ];

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
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: medicines.length,
                    itemBuilder: (context, index) =>
                        ItemRow(medicineName: medicines[index])),
              ),
              //const SizedBox(height: 150),

              const PriceDetails(
                priceValueCategory: 'Item Total',
              ),
              const PriceDetails(
                priceValueCategory: 'Discount',
              ),
              const PriceDetails(
                priceValueCategory: 'To Pay',
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
