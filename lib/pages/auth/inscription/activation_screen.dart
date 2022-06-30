
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unused_import, unnecessary_new

import 'dart:async';

import 'package:demo_app/data/controller/auth_controller.dart';
import 'package:demo_app/pages/main_page.dart';
import 'package:demo_app/utils/colors.dart';
import 'package:demo_app/utils/dimensions.dart';
import 'package:demo_app/widget/app_text_field.dart';
import 'package:demo_app/widget/big_text.dart';
import 'package:demo_app/widget/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:toggle_switch/toggle_switch.dart';


class ActivationScreen extends StatefulWidget {
  const ActivationScreen({ Key? key }) : super(key: key);
      static String routeName = "/otp";

  @override
  State<ActivationScreen> createState() => _ActivationScreenState();
}

class _ActivationScreenState extends State<ActivationScreen> {

    TextEditingController codeController = new TextEditingController();
    int activeButton = 0;
    late Timer _timer;


  @override
  Widget build(BuildContext context) {
      var codeController = TextEditingController();


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
        duration: Duration(milliseconds: 5000),
        //behavior: SnackBarBehavior.floating,

      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    _sendCodeSms() async {
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        String? ID = localStorage.getInt("ID").toString();
        print(ID);

        // var userId = userIdString as int;
        return AuthController().verificationPhone(ID).then((result) {
          var body = result.body;
           print(body);

             if(body["status"]) {
              _showText(body["message"]);
             }
        });

    }

    // _sendCodeEmail() async {
    //     SharedPreferences localStorage = await SharedPreferences.getInstance();
    //     var userIdString = localStorage.getInt("ID").toString();
    //     print(userIdString);

    //     // var userId = int.parse(userIdString);
    //     return AuthController().verificationEmail(userIdString).then((result) {
    //       var bordy = result.body;
    //        print(bordy);

    //          if(bordy["status"]) {
    //           _showText(bordy["message"]);
    //          }
    //     });

    // }

    _validateCode() async {

      var code = {
        'code': codeController.text, 
      };

      print(codeController.text);

        SharedPreferences localStorage = await SharedPreferences.getInstance();
        var userIdString = localStorage.getInt("ID").toString();
        print(userIdString);

        //var userId = int.parse(userIdString);
        var result = await AuthController().activatePhone(code, userIdString);
        if(result.statusCode == 200 ) {
          var body = json.decode(result.body);
          _showText(body['message']); 
          print(body);
          _timer = Timer.periodic(
            Duration(seconds: 1), 
            (Timer timer) {
              setState(() {
                timer.cancel();
                 Navigator.of(context).pushNamed("/home");
              });
            }
          );
         
                
        } else {
          var body = json.decode(result.body);
           _showText(body['message']);
        }
    }

    return 
    // Center(
    //           child: Container(
    //             child: SpinKitThreeBounce(
    //               itemBuilder: (BuildContext context, int index) {
    //                 return DecoratedBox(
    //                   decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(15),
    //                     color: index.isEven ? Color(0xFFC5565C) : Colors.grey,
    //                   ),
    //                 );
    //               }),
    //             ),
    //         )
            
            Scaffold(
              body: SafeArea(
              child: Container(
              padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BigText(
                      text:"Activation du numero  de telephone",
                      textAlign: TextAlign.center,
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
                    Minuterie(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ToggleSwitch(
                            minWidth: 90.0,
                            cornerRadius: 15.0,
                            activeBgColors: const [[Color.fromARGB(255, 46, 103, 125)], [Color(0xFFC5565C)]],
                            activeFgColor: Colors.white,
                            inactiveBgColor: Colors.grey,
                            inactiveFgColor: Colors.white,
                            initialLabelIndex: 1,
                            totalSwitches: 2,
                            labels: ['Email', 'Phone'],
                            radiusStyle: true,
                            onToggle: (index) {
                              if (index == 1) {
                                setState(() {
                                   activeButton = 0;
                                });
                              } else {
                                 setState(() {
                                   activeButton = 1;
                                });
                              }
                            },
                          ),
                          SizedBox(height: Dimensions.height30,),
                           if (activeButton == 0) 
                          AppTextField(
                            textController: codeController, 
                            hintText: "code recu par Sms ", 
                            icon: Icons.code,
                          )
                           else if(activeButton == 1)
                           AppTextField(
                            textController: codeController, 
                            hintText: "code recu par Email ", 
                            icon: Icons.code,
                          ),
                          SizedBox(height: Dimensions.height30,),
                            GestureDetector(
                              onTap: () {
                              //_validateCode();
                              Get.to(MainPage());
                              },
                              child: Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.bottonBackgrounColor,
                                ),
                                child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                  child: BigText(text: "Valider",),
                                ),
                              ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                "Aucun code recu ?",
                                
                                textAlign: TextAlign.center,
                              ),
                              GestureDetector(
                                onTap: () {
                                 //  _sendCodeSms();
                                },
                                child: Container(
                                  padding: EdgeInsets.all(15),
                                  child: const FittedBox(
                                      fit: BoxFit.scaleDown,
                                    child: Text(
                                      "Renvoyer",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.red
                                      ),

                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          );
  }

  Minuterie() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        "Entrer le code recu par sms avant: ",
        style: TextStyle(
          fontSize: 15,
        ),
      ),
      TweenAnimationBuilder(
        tween: Tween(begin: 59.0, end: 0.0), 
        duration: Duration(seconds: 59), 
        builder: (_, dynamic value, child) => Text(
          " 00: ${value.toInt()} Secondes",
          style: TextStyle(color: Color(0xFFC5565C)),
        ),
      ),
    ],
  );
}
}