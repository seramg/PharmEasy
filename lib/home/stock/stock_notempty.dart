
import 'package:flutter/cupertino.dart';

class stock_notempty extends StatelessWidget {
  final int stockno;
  const stock_notempty({
    Key? key, required this.stockno
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(stockno.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),);
  }
}
