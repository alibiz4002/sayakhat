import 'package:flutter/material.dart';

class AppLargeTextWidget extends StatelessWidget {
 final double size;
  final String text;
  final Color color;


  const AppLargeTextWidget({super.key,  this.size = 30, required this.text,  this.color=Colors.black });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color:color, 
        fontSize:size,
        fontWeight: FontWeight.bold
      )


    );
  }
}
