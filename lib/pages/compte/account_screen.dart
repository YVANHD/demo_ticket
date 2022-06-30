// ignore_for_file: prefer_const_constructors, avoid_print
import 'dart:convert';
import 'package:demo_app/pages/auth/connexion/connexion_screen.dart';
import 'package:demo_app/widget/account_menu.dart';
import 'package:demo_app/widget/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

  //var user = <User>[];

  @override
  void initState() {
    // _getSingleUser();
    super.initState();
  }

  // _getSingleUser() async {
  //   SharedPreferences localStorage = await SharedPreferences.getInstance();
  //     var ID = localStorage.getInt("ID").toString();
  //     print(ID);

  //     await ServiceApi().getUser(ID).then((response) {
  //       var userInfoBody = response.body;
  //       // ignore: unnecessary_null_comparison
  //       if(ID != null) {
  //         print(userInfoBody);
  //          User user = User.fromJson(userInfoBody);
  //       } else {
  //         print("il y a un probleme");
  //       }
  //       // setState(() {
  //       //   Iterable list = json.decode(body);
  //       //   var user = list.map((e) => User.fromJson(e)).toList();
  //       // });

  //     });
  // }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC5565C),
        title: Center(child: Text("Profil")),
      ),
        body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        
        child: Container(
          width: double.maxFinite,
          margin: EdgeInsets.only(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              AppIcon(
                icon: Icons.person,
                backgroundColor: Color(0xFFC5565C),
                iconColor: Colors.white,
                size: 120,
                iconSize: 70,
              ),
              SizedBox(
                height: 20,
              ),
              AccountMenu(
                text: "yvan",
                press: () {}, 
                appIcon: AppIcon(
                  icon: Icons.person,
                  backgroundColor: Color(0xFFC5565C),
                  iconColor: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              AccountMenu(
                text: "Prenom",
                press: () {}, 
                appIcon: AppIcon(
                  icon: Icons.person,
                  backgroundColor: Color(0xFFC5565C),
                  iconColor: Colors.white,
                  size: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              AccountMenu(
                text: "Numero",
                press: () {}, 
                appIcon: AppIcon(
                  icon: Icons.numbers,
                  backgroundColor: Color(0xFFC5565C),
                  iconColor: Colors.white,
                  size: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              AccountMenu(
                text: "Email",
                press: () {}, 
                appIcon: AppIcon(
                  icon: Icons.email,
                  backgroundColor: Color(0xFFC5565C),
                  iconColor: Colors.white,
                  size: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              AccountMenu(
                text: "Modifier mon compte",
                press: () {},
                appIcon: AppIcon(
                  icon: Icons.tips_and_updates,
                  backgroundColor: Colors.white,
                  iconColor: Color(0xFFC5565C),
                  size: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              AccountMenu(
                text: "Police de confidentialité",
                press: () {},
                appIcon: AppIcon(
                  icon: Icons.lock,
                  backgroundColor: Colors.white,
                  iconColor: Color(0xFFC5565C),
                  size: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              AccountMenu(
                text: "Deconnexion",
                appIcon: AppIcon(
                  icon: Icons.logout,
                  backgroundColor: Colors.white,
                  iconColor: Color(0xFFC5565C),
                  size: 20,
                ),
                press: () async{
                  // print("deconnexion");
                  // _deconnexion();
                  SharedPreferences localStorage = await SharedPreferences.getInstance();
                    localStorage.clear();
                   Get.to(LoginScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}