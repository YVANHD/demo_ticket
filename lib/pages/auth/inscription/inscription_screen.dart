
import 'dart:async';

import 'package:demo_app/data/controller/auth_controller.dart';
import 'package:demo_app/pages/auth/connexion/connexion_screen.dart';
import 'package:demo_app/pages/auth/inscription/activation_screen.dart';
import 'package:demo_app/pages/auth/forget/init_screen.dart';
import 'package:demo_app/utils/colors.dart';
import 'package:demo_app/utils/dimensions.dart';
import 'package:demo_app/widget/app_text_field.dart';
import 'package:demo_app/widget/big_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';




class InscriptionScreen extends StatefulWidget {
  const InscriptionScreen({ Key? key }) : super(key: key);

  @override
  State<InscriptionScreen> createState() => _InscriptionScreenState();
}

class _InscriptionScreenState extends State<InscriptionScreen> {

    TextEditingController lNameController = TextEditingController();
    TextEditingController fNameController = TextEditingController();
    TextEditingController genderController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextEditingController codeController = TextEditingController();

    bool _loading = false;
    late Timer _timer;

  @override
  void initState() {
    super.initState();
     _loading = false;
  }

    _showText(msg) {
      final snackBar = SnackBar(
        backgroundColor: const Color(0xFFC5565C),
        
        content: Text(
          msg,
          textAlign: TextAlign.center,
        ),
        action: SnackBarAction(
          label: 'Fermer',
          onPressed: () {},
        ),
        duration: const Duration(milliseconds: 3000),
        //behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),

      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }


    _registration() async {

        setState(() {
          _loading = true;
        });

      var data = {
        'lastname': lNameController.text ,
        'firstname': fNameController.text, 
        'gender': genderController.text, 
        'phone': phoneController.text, 
        'email': emailController.text, 
        'password': passController.text,
        "device": "mobile"
      };

      print(lNameController.text);
      print(fNameController.text);
      print(genderController.text);
      print(phoneController.text);
      print(emailController.text);
      print(passController.text);

      var response = await AuthController().registerUser(data, 'create');
        //print(response);

        if(response.statusCode == 200 ) {
          var body = json.decode(response.body);
        

          print(body);
          // _loading = false;         
         if(body['status'] == true) {
            SharedPreferences localStorage = await SharedPreferences.getInstance();
            localStorage.setString("token", body['token']);
            localStorage.setInt("ID", body['ID']);
            _showText(body["message"]);
              
            _timer = Timer.periodic(
              Duration(seconds: 1), 
              (Timer timer) {
                setState(() {
                  timer.cancel();
                   Navigator.of(context).pushNamed("/otp");
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:
         _loading
            ?   Center(
                  child: Container(
                    child: SpinKitThreeBounce(
                      itemBuilder: (BuildContext context, int index) {
                        return DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: index.isEven ? const Color(0xFFC5565C) : Colors.grey,
                          ),
                        );
                      }),
                    ),
                )
            :
            SingleChildScrollView(
              physics:  BouncingScrollPhysics(),
              child:Center(
                child: Column(
                  
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: BigText(text: "Inscrivez-vous à votre espace voyage")
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
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: AppTextField(
                        textController: lNameController, 
                        hintText: "Nom", 
                        icon: Icons.person,
                      ),
                    ),
                    SizedBox(height: Dimensions.height20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: AppTextField(
                        textController: fNameController, 
                        hintText: "Prenom", 
                        icon: Icons.person,
                      ),
                    ),
                    SizedBox(height: Dimensions.height20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: AppTextField(
                        textController: genderController, 
                        hintText: "Genre", 
                        icon: Icons.person,
                      ),
                    ),
                    SizedBox(height: Dimensions.height20,),
                    Padding(
                     padding: const EdgeInsets.only(left: 20, right: 20),
                      child: AppTextField(
                        textController: phoneController, 
                        hintText: "Telephone", 
                        icon: Icons.phone,
                      ),
                    ),
                    SizedBox(height: Dimensions.height20,),
                    Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                      child: AppTextField(
                        textController: emailController, 
                        hintText: "Email", 
                        icon: Icons.email,
                      ),
                    ),
                    SizedBox(height: Dimensions.height20,),
                    Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                      child: AppTextField(
                        textController: passController, 
                        hintText: "Password", 
                        icon: Icons.password,
                        isObscure: true,
                      ),
                    ),
                     SizedBox(height: Dimensions.height20,),
            Text(
                "En continuant, confirmez que vous acceptez nos termes et conditions",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.caption,
            ),
             SizedBox(height: Dimensions.height20,),
            GestureDetector(
                onTap: () {
                 Get.to(const ActivationScreen());
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.bottonBackgrounColor,
                  ),
                  child: FittedBox(
                      fit: BoxFit.scaleDown,
                    child: BigText(text: "Inscription",),
                  ),
                ),
            ),
            SizedBox(height: Dimensions.height20,),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Deja un compte ?",
                    
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
                          "Connexion",
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
              )
            ),
      //     //         mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     //         children: [
      //     //           GestureDetector(
      //     //             onTap: () {
      //     //               //_registration();
      //     //             },
      //     //             child: Container(
      //     //               padding: const EdgeInsets.all(15),
      //     //               child: const FittedBox(
      //     //                 fit: BoxFit.scaleDown,
      //     //                 child: Text(
      //     //                   "Inscription",
      //     //                   textAlign: TextAlign.center,
      //     //                   style: TextStyle(
      //     //                     color: Colors.white,
      //     //                     fontSize: 18,
      //     //                   ),
      //     //                 ),
      //     //               ),
      //     //               decoration: BoxDecoration(
      //     //                 borderRadius: BorderRadius.circular(20),
      //     //                 color: const Color(0xFFC5565C),
      //     //                 boxShadow: const [
      //     //                   BoxShadow(
      //     //                     color: Colors.grey,
      //     //                     offset: Offset(4, 4),
      //     //                     blurRadius: 15,
      //     //                     spreadRadius: 1,
      //     //                   ),
      //     //                   BoxShadow(
      //     //                     color: Colors.white,
      //     //                     offset: Offset(-4, -4),
      //     //                     blurRadius: 15,
      //     //                     spreadRadius: 1,
      //     //                   ),
      //     //                 ]
      //     //               ),
      //     //             ),
      //     //           ),
      //     //           GestureDetector(
      //     //             onTap: () {
      //     //               // Navigator.of(context).pushNamed("/connexion");
      //     //             },
      //     //             child: Container(
      //     //               padding: const EdgeInsets.all(15),
      //     //               decoration: BoxDecoration(
      //     //                 borderRadius: BorderRadius.circular(20),
      //     //                 color: Colors.white,
      //     //                 boxShadow: const [
      //     //                   BoxShadow(
      //     //                     color: Colors.grey,
      //     //                     offset: Offset(4, 4),
      //     //                     blurRadius: 15,
      //     //                     spreadRadius: 1,
      //     //                   ),
      //     //                   BoxShadow(
      //     //                     color: Colors.white,
      //     //                     offset: Offset(-4, -4),
      //     //                     blurRadius: 15,
      //     //                     spreadRadius: 1,
      //     //                   ),
      //     //                 ]
      //     //               ),
      //     //               child: const FittedBox(
      //     //                   fit: BoxFit.scaleDown,
      //     //                 child: Text(
      //     //                   "Déjà un compte ? | Connexion",
      //     //                   textAlign: TextAlign.center,
      //     //                   style: TextStyle(
      //     //                     color: Colors.black,
      //     //                     fontSize: 15,
      //     //                   ),
      //     //                 ),
      //     //               ),
      //     //             ),
      //     //           ),
      //     //         ],
      //     //       ),
      //     //     ),
      //     //   ),
      //     // ),
      //   ],
      // ),
      );
  }
  

}
