import 'package:flutter/cupertino.dart';

class PriceDetails extends StatelessWidget {
  final String priceValueCategory;
  final double total;
  const PriceDetails({
    Key? key,required this.priceValueCategory, required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        priceValueCategory=='To Pay'?Text(priceValueCategory,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 30) ,):Text(priceValueCategory),
        priceValueCategory=='To Pay'? Text(total.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30) ,): Text(total.toString()),
      ],
    );//₹
  }
}