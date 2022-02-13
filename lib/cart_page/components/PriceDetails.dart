import 'package:flutter/cupertino.dart';

class PriceDetails extends StatelessWidget {
  final String priceValueCategory;
  const PriceDetails({
    Key? key,required this.priceValueCategory
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        priceValueCategory=='To Pay'?Text(priceValueCategory,style: const TextStyle(fontWeight: FontWeight.bold) ,):Text(priceValueCategory),
        priceValueCategory=='To Pay'?const Text('₹42',style: TextStyle(fontWeight: FontWeight.bold) ,):const Text('₹42'),
      ],
    );//₹
  }
}