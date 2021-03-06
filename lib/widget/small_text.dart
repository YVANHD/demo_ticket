import 'package:demo_app/utils/colors.dart';
import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  double height;
  TextAlign? textAlign;
  SmallText({
    Key? key, 
    this.color = AppColors.textColor,
    required this.text,
    this.size = 12,
    this.height = 1.2,
    this.textAlign

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        //fontFamily: "Roboto",
        color: color,
        fontSize: size,
        height: height
      ),
    );
  }
}