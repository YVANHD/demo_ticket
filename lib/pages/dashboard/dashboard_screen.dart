
// ignore_for_file: use_key_in_FittedBox_constructors, prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

        final longueur = MediaQuery.of(context).size.height;
        final largeur = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      appBar: AppBar(
        backgroundColor: Color(0xFFebf8fd),
        elevation: 10,
        title: Text(
          "Mes CARTES", 
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          }, 
          icon: Icon(
            Icons.home,
            color: Colors.black,
          )
        ),
      ),
      body:
       Container(
        color: Colors.white,
        child: Container(
          height: longueur,
          child: Column(
            children: [
      
              Expanded(
                child: SingleChildScrollView(
                   child: Column(
                     children: [
                       for(int i =0; i < 10; i++)
                      Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: i.isEven? Color.fromARGB(255, 145, 69, 56) : Colors.blue.shade200,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    "GENERAL EXPRESS",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Image.asset('assets/images/car.png', height: 40, width: 40,),
                              ],
                            ),
                            Divider(thickness: 1,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        "TARIF",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        "CLASSE",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        "3500 Fcfa",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        "Economie",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    FittedBox(
                                    fit: BoxFit.scaleDown,
                                      child: Text(
                                        "DEPART",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        "PASSAGER",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                    FittedBox(
                                        fit: BoxFit.scaleDown,
                                      child: Text(
                                        "ARRIVEE",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    FittedBox(
                                        fit: BoxFit.scaleDown,
                                      child: Text(
                                        "Yaounde",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                    FittedBox(
                                        fit: BoxFit.scaleDown,
                                      child: Text(
                                        "1",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                    FittedBox(
                                        fit: BoxFit.scaleDown,
                                      child: Text(
                                        "Douala",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    FittedBox(
                                        fit: BoxFit.scaleDown,
                                      child: Text(
                                        "NUMERO PASSAGER",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                    FittedBox(
                                        fit: BoxFit.scaleDown,
                                      child: Text(
                                        "PLACE",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                    FittedBox(
                                        fit: BoxFit.scaleDown,
                                      child: Text(
                                        "NUMERO TICKET",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    FittedBox(
                                        fit: BoxFit.scaleDown,
                                      child: Text(
                                        "00000000",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                    FittedBox(
                                        fit: BoxFit.scaleDown,
                                      child: Text(
                                        "A2",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                    FittedBox(
                                        fit: BoxFit.scaleDown,
                                      child: Text(
                                        "11111111",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    FittedBox(
                                        fit: BoxFit.scaleDown,
                                      child: Text(
                                        "Date",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                    FittedBox(
                                        fit: BoxFit.scaleDown,
                                      child: Text(
                                        "18 Mars 2022",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    Image.asset('assets/images/code.png', height: 45, width: 45,),
                      
                                  ],
                                ),
                                SizedBox(height: 12),
                              ],
                            ),
                          ],
                        ),
                      ),
                        ),
                     ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),



      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(
          Icons.add,
        ),
        onPressed: () {},
        label: const Text('Rechercher'),
        backgroundColor: Color(0xFFC5565C),
      ),
    );
  }
}