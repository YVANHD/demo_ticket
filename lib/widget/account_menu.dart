// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:demo_app/widget/app_icon.dart';
import 'package:flutter/material.dart';

class AccountMenu extends StatelessWidget {
    final String text;
    final VoidCallback? press;
    final AppIcon appIcon;

  const AccountMenu({
    Key? key,
    required this.text,
    this.press,
    required this.appIcon,
    }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        //vertical: 5,
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.black,
          padding: EdgeInsets.all(18),
          shape: 
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: Colors.white,
        ),
        onPressed: press,
       child: Row(
          children: [
            Expanded(
              child: Text(
                text,
              ),
            ),
            appIcon
          ],
        ),
      ),
    );
  }
  
}