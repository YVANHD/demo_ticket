

import 'dart:async';
import 'dart:convert';

import 'package:demo_app/data/controller/auth_controller.dart';
import 'package:demo_app/pages/auth/inscription/inscription_screen.dart';
import 'package:demo_app/pages/home/home_screen.dart';
import 'package:demo_app/pages/main_page.dart';
import 'package:demo_app/pages/welcome/components/background.dart';
import 'package:demo_app/routes/route_helper.dart';
import 'package:demo_app/utils/colors.dart';
import 'package:demo_app/utils/dimensions.dart';
import 'package:demo_app/widget/app_text_field.dart';
import 'package:demo_app/widget/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatelessWidget {
   TextEditingController phoneController = new TextEditingController();
    TextEditingController passController = new TextEditingController();
     bool _loading = false;
          late Timer _timer;

     
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BigText(text: "BIENVENUE", size: 30, color: Colors.white,),
            SizedBox(
              height: Dimensions.height30,
            ),
            Image.asset(
              "assets/images/logo/logo.png",
              width: Dimensions.splashImg,
            ),
            SizedBox(
              height: Dimensions.height30,
            ),

            Container(
              height: Dimensions.height45,
              margin: EdgeInsets.symmetric(vertical: Dimensions.width10),
              width: size.width /2,
              decoration: BoxDecoration(
                color: AppColors.signColor,
                borderRadius: BorderRadius.circular(Dimensions.radius15),

              ),
              child: InkWell(
                onTap: () {
                  Get.bottomSheet(
                    login(),
                  );
                },
                child: Center(
                  child: BigText(text: "Connexion")
                ),
              ),
            ),
            SizedBox(height: Dimensions.height10),
            Container(
              height: Dimensions.height45,
              margin: EdgeInsets.symmetric(vertical: Dimensions.width10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.radius15),

              ),
              width: size.width /2,
              child: InkWell(
                onTap: () {
                  Get.to(MainPage());
                },
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: BigText(text: "Démarrer")
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget login() {

    var phoneController = TextEditingController();
    var passController = TextEditingController();

    return  Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(Dimensions.radius20),
        topRight: Radius.circular(Dimensions.radius20)
      ),
      color: Colors.white,
    ),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AppTextField(
            textController: phoneController, 
            hintText: "Telephone", 
             icon: Icons.phone,
          ),
          AppTextField(
            textController: passController,
            hintText: "Password",
            icon: Icons.password,
            isObscure: true,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Mot de passe oublié ?",
                
                textAlign: TextAlign.center,
              ),
              GestureDetector(
                onTap: () {
                  
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: FittedBox(
                      fit: BoxFit.scaleDown,
                    child: Text(
                      "Réinitialisation ",
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
          GestureDetector(
            onTap: () {
              _connexion();
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Pas encore inscrit ?",
                
                textAlign: TextAlign.center,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(const InscriptionScreen());
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
    );
  }
  
  _connexion() async {
    _loading = true;

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
           Get.snackbar("notifications",(body["message"]));
            _timer = Timer.periodic(
              Duration(seconds: 1), 
              (Timer timer) {
                timer.cancel();
                Get.to(HomeScreen());
              }
            );
          } else {
             Get.snackbar("notifications",(body["message"]));
          }

            _loading = false;

      } 
    }

  _forgot() async {
     Get.snackbar("notifications", "un instant svp");
  }

}