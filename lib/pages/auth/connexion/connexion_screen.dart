
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unused_import, unnecessary_new

import 'dart:async';

import 'package:demo_app/data/controller/auth_controller.dart';
import 'package:demo_app/pages/auth/forget/forgot_screen.dart';
import 'package:demo_app/pages/main_page.dart';
import 'package:demo_app/utils/colors.dart';
import 'package:demo_app/utils/dimensions.dart';
import 'package:demo_app/widget/app_text_field.dart';
import 'package:demo_app/widget/big_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);
      static String routeName = "/connexion";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

    TextEditingController phoneController = new TextEditingController();
    TextEditingController passController = new TextEditingController();

    final _formKey = GlobalKey<FormState>();
    bool _loading = false;


  @override
  Widget build(BuildContext context) {
    var phoneController = TextEditingController();
    var passController = TextEditingController();
     late Timer _timer;

  @override
  void initState() {
    super.initState();
     _loading = false;
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

  _connexion() async {
       setState(() {
          _loading = true;
        });

      var data = {
        'phone': phoneController.text, 
        'password': passController.text,
      };

      print(phoneController.text);
      print(passController.text);

      var response = await AuthController().loginUser(data, 'login');


        if(response.statusCode == 200 ) {
            var body = json.decode(response.body);
          print(body);
           _loading = false;

          if(body["status"] == true) {
            SharedPreferences localStorage = await SharedPreferences.getInstance();
            localStorage.setString("token", body['token']);
            // localStorage.setString("user", json.encode(body['user']));
            _showText(body["message"]);
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
            _showText(body["message"]);
          }

          setState(() {
            _loading = false;
          });

      } 
    }

      _forgot() async {
      _showText("Un instant svp");
  }

    return _loading
    ?
            Center(
                      child: Container(
                        child: SpinKitThreeBounce(
                          itemBuilder: (BuildContext context, int index) {
                            return DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: index.isEven ? Color(0xFFC5565C) : Colors.grey,
                              ),
                            );
                          }),
                        ),
                    )
            :
            Scaffold(
              body: SafeArea(
              child: Container(
              padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: BigText(text: "Connectez-vous à votre espace voyage")
                        ),
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
                    SizedBox(height: Dimensions.height20,),
                    Text(
                      "Entrer un numero de telephone et un mot de passe",
                      textAlign: TextAlign.center,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppTextField(
                            textController: phoneController, 
                            hintText: "Telephone", 
                            icon: Icons.phone,
                          ),
                          const SizedBox(height: 20),
                          AppTextField(
                            textController: passController, 
                            hintText: "Password", 
                            icon: Icons.password,
                            isObscure: true,
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Mot de passe oublié ?",
                                textAlign: TextAlign.center,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(ForgotScreen());
                                },
                                child: Container(
                                  padding: EdgeInsets.all(15),
                                  child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                    child: Text(
                                      "Réinitialisation ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: Dimensions.height20,),
                            GestureDetector(
                                onTap: () {
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
                                    child: BigText(text: "Connexion",),
                                  ),
                                ),
                            ),
                            SizedBox(height: Dimensions.height20,),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              "Pas encore inscrit ?",
                              
                              textAlign: TextAlign.center,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(const LoginScreen());
                              },
                              child: Container(
                                padding: EdgeInsets.all(15),
                                child: const FittedBox(
                                    fit: BoxFit.scaleDown,
                                  child: Text(
                                    "Inscription",
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
                    ),
                  ],
                ),
              ),
            ),
          );
  }
  
}