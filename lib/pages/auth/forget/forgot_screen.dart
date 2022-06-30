
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unused_import

import 'dart:async';
import 'dart:convert';

import 'package:demo_app/data/controller/auth_controller.dart';
import 'package:demo_app/pages/auth/forget/init_screen.dart';
import 'package:demo_app/utils/colors.dart';
import 'package:demo_app/utils/dimensions.dart';
import 'package:demo_app/widget/app_text_field.dart';
import 'package:demo_app/widget/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForgotScreen extends StatefulWidget {
  static String routeName = "/forgot";

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
    int activeButton = 0;


  @override
  Widget build(BuildContext context) {

    final largeur = MediaQuery.of(context).size.width;
    var phoneController = TextEditingController();
    var emailController = TextEditingController();
    late Timer _timer;

  @override
    void initState() {
      super.initState();
    }

    _showText(msg) {
      final snackBar = SnackBar(
        backgroundColor: Color(0xFFC5565C),
        content: Text(msg),
        action: SnackBarAction(
          label: 'Fermer',
          onPressed: () {
            // Some code to undo the change!
          },
        ),
        duration: const Duration(milliseconds: 8000),
        //behavior: SnackBarBehavior.floating,

      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    _askInitiateCodeBySms() async {

      var data = {
        'phone': phoneController.text, 
        'device': "mobile", 
      };
      print(phoneController.text);

      var response = await AuthController().forgotBySms(data, 'forgot-password');
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString("phone", phoneController.text);

      if(response.statusCode == 200 ) {
          var body = json.decode(response.body);
          print(body);
           _showText(body["message"]);
          _timer = Timer.periodic(
            Duration(seconds: 3), 
            (Timer timer) {
              setState(() {
                timer.cancel();
                //  Navigator.of(context).pushNamed("/otpforgot");
                 //Get.to(OtpForgotScreen());
              });
            }
          );
      } else {
         var body = json.decode(response.body);
          print(body);
           _showText(body["message"]);
      }
    }


    return Scaffold(
      body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Vous avez oublié votre mot de passe ?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),textAlign: TextAlign.center,
                ),
                Padding(
                    padding:  const EdgeInsets.all(10),
                    child: Container(
                      height: 80,
                      child: Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.grey.shade300,
                          radius: 80,
                          backgroundImage:  AssetImage(
                            "assets/images/car.png"
                          ),
                        ),
                      ),
                    ),
                  ),
                Text(
                  "Veuillez entrer votre numero de telephone et nous \nvous enverrons un code pour revenir à votre compte",
                  textAlign: TextAlign.center,
                ),
                
                           if (activeButton == 0) 
                          AppTextField(
                            textController: phoneController, 
                            hintText: "Telephone ", 
                            icon: Icons.phone,
                          )
                           else if(activeButton == 1)
                           AppTextField(
                            textController: emailController, 
                            hintText: " Email ", 
                            icon: Icons.email,
                          ),
                          SizedBox(height: Dimensions.height20,),
                            GestureDetector(
                                onTap: () {
                                Get.to(InitScreen());
                                },
                                child: Container(
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.bottonBackgrounColor,
                                  ),
                                  child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                    child: BigText(text: "Continuer",),
                                  ),
                                ),
                            ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //   children: [
                          //     Text(
                          //       "Essayer une autre",
                          //       style: TextStyle(
                          //         fontSize: getProportionateScreenWidth(10),
                          //       ),
                          //       textAlign: TextAlign.center,
                          //     ),
                          //     GestureDetector(
                          //       onTap: () {
                          //         changeAppText();
                          //       },
                          //       child: Container(
                          //         padding: EdgeInsets.all(15),
                          //         child: FittedBox(
                          //             fit: BoxFit.scaleDown,
                          //           child: Text(
                          //             "Méthode",
                          //             textAlign: TextAlign.center,
                          //             style: TextStyle(
                          //               color: Colors.red,
                          //               fontSize: getProportionateScreenWidth(10),
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // ToggleSwitch(
                          //   minWidth: 90.0,
                          //   cornerRadius: 15.0,
                          //   activeBgColors: const [[Color.fromARGB(255, 46, 103, 125)], [Color(0xFFC5565C)]],
                          //   activeFgColor: Colors.white,
                          //   inactiveBgColor: Colors.grey,
                          //   inactiveFgColor: Colors.white,
                          //   initialLabelIndex: 1,
                          //   totalSwitches: 2,
                          //   labels: ['Email', 'Phone'],
                          //   radiusStyle: true,
                          //   onToggle: (index) {
                          //     if (index == 1) {
                          //       setState(() {
                          //          activeButton = 0;
                          //       });
                          //     } else {
                          //        setState(() {
                          //          activeButton = 1;
                          //       });
                          //     }
                          //   },
                          // ),
              ],
            ),
          ),
     ),
    );
  }
}