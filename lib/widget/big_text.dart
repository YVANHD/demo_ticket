
import 'package:demo_app/utils/colors.dart';
import 'package:demo_app/utils/dimensions.dart';
import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  TextOverflow overFlow;
  TextAlign? textAlign;
  
  BigText({
    Key? key, 
    this.color = AppColors.mainBlackColor,
    required this.text,
    this.size = 0,
    this.overFlow = TextOverflow.ellipsis,
    this.textAlign

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 2,
      overflow: overFlow,
      style: TextStyle(
        //fontFamily: "Roboto",
        color: color,
        fontWeight: FontWeight.w400, 
        fontSize: size == 0 ? Dimensions.font20 : size,
      ),
    );
  }
}