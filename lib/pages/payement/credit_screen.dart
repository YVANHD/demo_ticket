// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field

import 'dart:async';

import 'package:demo_app/pages/payement/success_screen.dart';
import 'package:demo_app/widget/app_text_field.dart';
import 'package:demo_app/widget/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreditScreen extends StatefulWidget {
   static String routeName = "/paiement";

  const CreditScreen({ Key? key }) : super(key: key);

  @override
  State<CreditScreen> createState() => _CreditScreenState();
}

class _CreditScreenState extends State<CreditScreen> {

    TextEditingController phoneController = new TextEditingController();
    TextEditingController moneyCodeController = new TextEditingController();

  int activeCard = 0;
  bool _isloading = false;
  late Timer _timer;

    _showText(msg) {
      final snackBar = SnackBar(
        backgroundColor: const Color(0xFFC5565C),
        content: Text(
          msg,
          textAlign: TextAlign.center,
        ),
        action: SnackBarAction(
          label: 'Fermer',
          onPressed: () {
            // Some code to undo the change!
          },
        ),
        duration: const Duration(milliseconds: 3000),
        //behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),

      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

_payer() {
    setState(() {
      _isloading = true;
    });

    _timer = Timer.periodic(
      Duration(seconds: 3), 
      (Timer timer) {
        setState(() {
          _isloading = false;
          timer.cancel();
          // Navigator.of(context).pushNamed("/successpay");
          Get.to(SuccesScreen());
        });
       }
    );
  }

  
  @override
  Widget build(BuildContext context) {

    final longueur = MediaQuery.of(context).size.height;
    final largeur = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Text(
          "Reglement de la facture",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (activeCard == 0) AnimatedOpacity(
                opacity: activeCard == 0 ? 1 : 0,
                duration: Duration(milliseconds: 500),
                child: Container(
                  width: double.infinity,
                  height: 150,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Carte de Credit",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "+ 237  6   **   **   **   ** ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "ORANGE MONEY",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Image.asset("assets/images/sim.png", height: 35),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ) else if (activeCard == 1) AnimatedOpacity(
                opacity: activeCard == 1 ? 1 : 0,
                duration: Duration(milliseconds: 500),
                child: Container(
                  width: double.infinity,
                  height: 150,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blue.shade100,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Carte de Credit",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "+ 237  6   **   **   **   ** ",
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 25,
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "EXPRESS UNION MOBILE",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                              Image.asset("assets/images/sim.png", height: 35),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // child: Container(
                //   width: double.infinity,
                //   height: 150,
                //   padding: EdgeInsets.all(20),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(30),
                //     color: Color.fromARGB(26, 121, 89, 89),
                //   ),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text(
                //         "Carte de Credit",
                //         style: TextStyle(
                //           color: Colors.white,
                //         ),
                //       ),
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Image.network('https://img.icons8.com/dotty/80/000000/add-dollar.png', height: 35),
                //           SizedBox(height: 20,),
                //         ],
                //       ),
                //       Text(
                //             "+ 237  6   **   **   **   ** ",
                //             style: TextStyle(
                //               color: Colors.white,
                //               fontSize: 25,
                //             ),
                //           ),
                //           SizedBox(height: 5),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         crossAxisAlignment: CrossAxisAlignment.end,
                //         children: [
                //           Text(
                //             "EXPRESS UNION MOBILE",
                //             style: TextStyle(
                //               color: Colors.black,
                //               fontSize: 15
                //             ),
                //           ),
                //           Image.network(
                //             'https://img.icons8.com/ios/2x/sim-card-chip.png',
                //             height: 35,),
                //         ],
                //       )
                //     ],
                //   ),
                // ),
              )
              else if (activeCard == 2) AnimatedOpacity(
                  opacity: activeCard == 2 ? 1 : 0,
                  duration: Duration(milliseconds: 500),
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.yellow.shade100,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Carte de Credit",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "+ 237  6   **   **   **   ** ",
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 25,
                              ),
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "MTN MOBILE MONEY",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                                Image.asset("assets/images/sim.png", height: 35),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
              ),

              SizedBox(height: 20,),
              Text(
                "Methode de paiement",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10,),

              SizedBox(
                width: double.infinity,
                child: Wrap(
                  spacing: 10,
                    children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          activeCard  = 1;
                        });
                      },
                      child: Container(
                        //duration: Duration(milliseconds: 500),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: activeCard == 1
                            ? Border.all(color: Colors.grey.shade300, width: 1)
                            : Border.all(color: Colors.grey.shade300.withOpacity(0), width: 1),
                        ),
                        child: Image.asset("assets/images/eu.png", height: 50,),

                      ),
                    ),
                     GestureDetector(
                      onTap: () {
                        setState(() {
                          activeCard  = 0;
                        });
                      },
                      child: Container(
                        // duration: Duration(milliseconds: 500),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: activeCard == 0
                            ? Border.all(color: Colors.grey.shade300, width: 1)
                            : Border.all(color: Colors.grey.shade300.withOpacity(0), width: 1),
                        ),
                        child: Image.asset("assets/images/orange.png", height: 50,),

                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          activeCard  = 2;
                        });
                      },
                      child: Container(
                        // duration: Duration(milliseconds: 500),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: activeCard == 0
                              ? Border.all(color: Colors.grey.shade300, width: 1)
                              : Border.all(color: Colors.grey.shade300.withOpacity(0), width: 1),
                        ),
                        child: Image.asset("assets/images/mtn.png", height: 50,),

                      ),
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     setState(() {
                    //       activeCard  = 2;
                    //     });
                    //   },
                    //   child: Container(
                    //     // duration: Duration(milliseconds: 500),
                    //     margin: EdgeInsets.all(20),
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(20),
                    //       border: activeCard == 0
                    //           ? Border.all(color: Colors.grey.shade300, width: 1)
                    //           : Border.all(color: Colors.grey.shade300.withOpacity(0), width: 1),
                    //     ),
                    //     child: Image.asset("assets/images/mtn.png", height: 50,),

                    //   ),
                    // ),
                  ]
                ),
              ),

              SizedBox(height: 50),
              Text(
                "Informations du compte mobile",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.caption,
              ),
              const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: AppTextField(
                      textController: phoneController, 
                      hintText: "numero mobile", 
                      icon: Icons.phone,
                    ),
                  ),
              SizedBox(height: 20),
              Text(
                "Obtenez le code OTP en composant le #150*4*4#",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.caption,
              ),
              const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: AppTextField(
                      textController: moneyCodeController, 
                      hintText: "code de validation", 
                      icon: Icons.code,
                    ),
                  ),
              // if (activeCard == 0)
              //   SizedBox(height: 10,),
              //   //const Spacer(flex: 1),
              //   buildPhoneFormField(),
              // if (activeCard == 0)
              //   SizedBox(height: 10,),
              // //const Spacer(flex: 1),
              // buildCodeFormField(),
              // SizedBox(height: 10,),
              // Container(
              //   height: 50,
              //   padding: EdgeInsets.only(left: 20),
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     color: Colors.white,
              //   ),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         "Addresse",
              //         style: TextStyle(
              //           fontSize: 15,
              //           fontWeight: FontWeight.w600,
              //         ),
              //       ),
              //       TextButton(
              //         onPressed: () {},
              //         child: Row(
              //           children: [
              //             Text("Yaoundé, Carrefour Nvam"),
              //             Icon(Icons.keyboard_arrow_down, size: 20,)
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(height: 30,),
              // MaterialButton(
              //   onPressed: () {
              //     Payer();
              //   },
              //   height: 50,
              //   elevation: 0,
              //   splashColor: Colors.orange,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              //   color: Colors.blue,
              //   child: Center(
              //     child: _isloading ? Container(
              //       width: 15,
              //       height: 20,
              //       child: CircularProgressIndicator(
              //         backgroundColor: Colors.white,
              //         strokeWidth: 5,
              //         color: Colors.black,
              //       ),
              //     ) :
              //     Text(
              //       "Payer",
              //       style: TextStyle(
              //         fontSize: 20,
              //         fontWeight: FontWeight.bold,
              //         color: Colors.white,
              //       ),
              //     ),
              //   ),
              // ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 40),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        " Frais",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        " 350 F cfa",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        " Prix",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        " 3.500 F cfa",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        " Total ( 1 )",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        " 3.850 F cfa",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          BottomAppBar(
            notchMargin: 0,
            child: Container(
              height: 70,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: SmallText(
                        text: "Un souci ? | Revenir",
                        textAlign: TextAlign.center,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _showText("Veuillez patienter...");
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SmallText(
                        text: "Payer",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

  }
}