// ignore_for_file: prefer_const_constructors

import 'package:demo_app/pages/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccesScreen extends StatefulWidget {

  const SuccesScreen({ Key? key }) : super(key: key);

  @override
  State<SuccesScreen> createState() => _SuccesScreenState();
}

class _SuccesScreenState extends State<SuccesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/accepted.png",
              width: 400,
            ),
            SizedBox(height: 50,),
            Text(
              "Paiement Réussi!",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0)
              ),
            ),
            SizedBox(height: 20,),
            Text(
              "Votre paiement à été completé avec success...",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20,),
            MaterialButton(
              onPressed: () {
                Get.to(DashboardScreen());
              },
              height: 50,
              elevation: 10,
              splashColor: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Color.fromARGB(255, 253, 253, 253),
              child: Center(
                child: Text(
                  "Embarquement",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text(
              "Merci de nous avoir fait confiance. Bon Voyage!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}