import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight? fontWeight;
  final double size;
  final int? maxLine;

  const CustomText({Key? key, required this.text,this.color=Colors.black, this.fontWeight, this.size=15.0, this.maxLine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,maxLines: maxLine,style: TextStyle(
      color: color,fontSize: size,fontWeight: fontWeight,
    ),);
  }
}
