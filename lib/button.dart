
import 'package:flutter/material.dart';
import 'package:pharmeasy/verify.dart';

class Button extends StatelessWidget {
 final TextEditingController? phoneNo;
 final Function? onClick;
  final String btntxt;
   const Button({
    Key? key, required this.btntxt, this.onClick,this.phoneNo
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(

        onPressed: () {
          onClick!();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  Verify(phone:phoneNo!)),
          );
        },
        child:  Text(
         btntxt.toUpperCase(),
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20),
        ),
        style: ButtonStyle(

          padding:MaterialStateProperty.all(
              const EdgeInsets.all(16.0)),

          elevation: MaterialStateProperty.all(0.0),

          backgroundColor:
          MaterialStateProperty.all(const Color(0xFF7D97F3)),
          shape:
          MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
          ),
        ),
      ),
    );
  }
}
