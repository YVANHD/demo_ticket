
// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:convert';

import 'package:demo_app/data/controller/auth_controller.dart';
import 'package:demo_app/pages/auth/connexion/connexion_screen.dart';
import 'package:demo_app/pages/main_page.dart';
import 'package:demo_app/utils/colors.dart';
import 'package:demo_app/utils/dimensions.dart';
import 'package:demo_app/widget/app_text_field.dart';
import 'package:demo_app/widget/big_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitScreen extends StatefulWidget {
  static String routeName = "/otpforgot";

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  @override
  Widget build(BuildContext context) {
      var codeController = TextEditingController();
      var resetPassController = TextEditingController();
      var confirmPassController = TextEditingController();
      late Timer _timer;
        bool _loading = false;

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
          onPressed: () {},
        ),
        duration: Duration(milliseconds: 5000),
        //behavior: SnackBarBehavior.floating,

      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    _validateCode() async {

       setState(() {
          _loading = true;
        });

      var code = {
        'code': codeController.text, 
        "password": resetPassController.text,
        "confirm": confirmPassController.text,
      };

      print(codeController.text);

        SharedPreferences localStorage = await SharedPreferences.getInstance();
        var phone = localStorage.getString("phone");
        print(phone);

        var result = await AuthController().reInitiateCode(code, phone, codeController.text);
        if(result.statusCode == 200 ) {
          var body = json.decode(result.body);
          print(body);
           _loading = false;

           if(body['status'] == true) {
             _showText(body["message"]);
              Get.to(LoginScreen());
           } else {
            _showText(body['message']); 
           }

          // _timer = Timer.periodic(
          //   Duration(seconds: 3), 
          //   (Timer timer) {
          //     setState(() {
          //       timer.cancel();
          //        Navigator.of(context).pushNamed("/connexion");
          // Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //               builder: (context) => OtpScreen()),
            //        );
          //     });
          //   }
          // );     
          setState(() {
            _loading = false;
          });
     
        } else {
           var body = json.decode(result.body);
         _showText(body['message']); 
        }

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
                Text(
                  "Identification du numero  de telephone",
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
               Minuterie(),
                
                AppTextField(
                  textController: codeController, 
                  hintText: "code ", 
                  icon: Icons.code,
                ),
                AppTextField(
                  textController: resetPassController, 
                  hintText: "Mot de passe ", 
                  icon: Icons.password,
                  isObscure: true,
                ),
                AppTextField(
                  textController: confirmPassController, 
                  hintText: "Confirmer le mot de passe ", 
                  icon: Icons.password,
                  isObscure: true,
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
                        child: BigText(text: "Continuer",),
                      ),
                    ),
                ),
              ],
            ),
          ),
      ),
    );
  }
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