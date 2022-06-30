
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, unused_field, unused_local_variable, must_be_immutable, unused_element, avoid_print

import 'package:demo_app/pages/travellist/travel_list_screen.dart';
import 'package:demo_app/utils/colors.dart';
import 'package:demo_app/utils/dimensions.dart';
import 'package:demo_app/widget/app_icon.dart';
import 'package:demo_app/widget/app_text_field.dart';
import 'package:demo_app/widget/big_text.dart';
import 'package:demo_app/widget/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
    void initState() {
      super.initState();
     //  _getSingleUser();
    }

  @override
  Widget build(BuildContext context) {

    final largeur = MediaQuery.of(context).size.width;
    final longueur = MediaQuery.of(context).size.height;

    var originController = TextEditingController();
    var arriveController = TextEditingController();
    var classeController = TextEditingController();
    var dateController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(top: 10),
        // color: Colors.white,
        child: Column(
          children: [
            Container(
             width: largeur,
             height: 80,
             margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(20),
               color: Colors.blue.shade100,
             ),
             child: Container(
               padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   const CircleAvatar(
                     backgroundColor: Colors.transparent,
                     radius: 30,
                     backgroundImage: const AssetImage(
                       "assets/images/car.png",
                     ),
                   ),
                   // const SizedBox(width: 10),
                   Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       BigText(text: "Bienvenue"),
                       SizedBox(height: Dimensions.height10/2),
                       SmallText(text: "Yvan")
                     ],
                   ),
                  // Expanded(child: Container()),
                  Container(
                     width: 50,
                     height: 50,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(20),
                       color: Colors.white,
                     ),
                     child: AppIcon(
                       icon: Icons.notification_add,
                       iconColor: Colors.black,
                       backgroundColor: Colors.white,
                     ),
                  )
                 ],
               ),
             ),
           ),
           SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(left: Dimensions.width15, right: Dimensions.width15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallText(text: "Rechercher un itinéraire"),
                  Container(
                    width: 90,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15/3),
                      border: Border.all(
                        width: 1,
                        color: AppColors.mainColor,
                      ),
                    ),
                    child: GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SmallText(text: "Trouver", color: AppColors.mainColor,),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                            size: 20,
                          ),
                        ],
                      ),
                      onTap: () {
                         Get.to(TravelScreen());
                      },
                      
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: largeur,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                // color: Colors.orange,
              ),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  AppTextField(textController: originController, hintText: "Depart", icon: Icons.home),
                   SizedBox(height: 10),
                  AppTextField(textController: originController, hintText: "Arrivée", icon: Icons.home),
                   SizedBox(height: 10),
                  AppTextField(textController: originController, hintText: "Classe", icon: Icons.class_rounded),
                   SizedBox(height: 10),
                  AppTextField(textController: originController, hintText: "Date", icon: Icons.date_range),
                ],
              ),
            ),
          SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallText(text: "Vos Itinéraires"),
                  Container(
                    width: 90,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15/3),
                      border: Border.all(
                        width: 1,
                        color: AppColors.mainColor,
                      ),
                    ),
                    child: GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SmallText(text: "Voir", color: AppColors.mainColor,),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                            size: 20,
                          ),
                        ],
                      ),
                      onTap: () {
                        Get.to(TravelScreen());
                      },
                      
                    ),
                  ),
                ],
              ),
            ),
          SizedBox(height: 20),
          Container(  
              height: 250,
              child: PageView.builder(
                controller: PageController(viewportFraction: 0.90),
                itemCount: 5,
                itemBuilder: (_, i) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: largeur,
                    height: 240,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                        color: i.isEven ? Color.fromARGB(255, 185, 146, 148) : Colors.grey,
                    ),
                     child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              _myIconDestination(),
                              SizedBox(width: Dimensions.width45),
                              _myOriginAndDestination(),
                              SizedBox(width: Dimensions.width45),
                                _myIconDestination(),
                            ],
                          )
                        ],
                      ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
      
          ],
        ),
      )
    );
  }

  //   _getSingleUser() async {
  //   SharedPreferences localStorage = await SharedPreferences.getInstance();
  //     // ignore: non_constant_identifier_names
  //     var ID = localStorage.getInt("ID").toString();
  //     print(ID);

  //     await ServiceApi().getUser(ID).then((response) {
  //       var body = response.body;
  //       // ignore: unnecessary_null_comparison
  //       if(ID != null) {
  //         print(body);
  //       } else {
  //         print("il y a un probleme");
  //       }
  //       // setState(() {
  //       //   Iterable list = json.decode(body);
  //       //   var user = list.map((e) => User.fromJson(e)).toList();
  //       // });

  //     });
  // }
}



  Widget _myIconDestination() {
    return Column(
     children: [
        Icon(
          Icons.blur_circular,
          color: Color.fromARGB(255, 0, 23, 128),
          size: 10,
        ),
        SizedBox(height: 10),
         Icon(
          Icons.fiber_manual_record,
          color: Color.fromARGB(255, 0, 23, 128),
          size: 5,
        ),
         Icon(
          Icons.fiber_manual_record,
          color: Color.fromARGB(255, 0, 23, 128),
          size: 5,
        ),
         Icon(
          Icons.fiber_manual_record,
          color: Color.fromARGB(255, 0, 23, 128),
          size: 5,
        ),
         Icon(
          Icons.fiber_manual_record,
          color: Color.fromARGB(255, 0, 23, 128),
          size: 5,
        ),
         Icon(
          Icons.fiber_manual_record,
          color: Color.fromARGB(255, 0, 23, 128),
          size: 5,
        ),
        SizedBox(height: 10),
        Image.asset('assets/images/car.png', height: 30, width: 30,),
        SizedBox(height: 10),
        Icon(
          Icons.fiber_manual_record,
          color: Colors.white,
          size: 5,
        ),
        Icon(
          Icons.fiber_manual_record,
          color: Colors.white,
          size: 5,
        ),
        Icon(
          Icons.fiber_manual_record,
          color: Colors.white,
          size: 5,
        ),
        Icon(
          Icons.fiber_manual_record,
          color: Colors.white,
          size: 5,
        ),
        Icon(
          Icons.fiber_manual_record,
          color: Colors.white,
          size: 5,
        ),
        SizedBox(height: 10),
         Icon(
          Icons.blur_circular,
          color: Colors.white,
          size: 10,
        ),
     ],
    );
  }

  Widget _myOriginAndDestination() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(height: 15,),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Origine \n",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10
                ),
              ),
              TextSpan(
                text: "Yaoundé \n",
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 20
                ),
              ),
              TextSpan(
                text: "Mvan \n",
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 10
                ),
              ),
            ]
          ),
        ),
    
        SizedBox(height: 35,),
    
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Destination \n",
                style: TextStyle(
                  fontSize: 10
                ),
              ),
              TextSpan(
                text: "Douala \n",
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 20
                ),
              ),
              TextSpan(
                text: "Makepe \n",
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 10
                ),
              ),
            ]
          ),
        ),
      ],
    );
  }

  Widget _myOriginAndDestinationIcon() {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Column(
        children: [
          Text(
            "GEY",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(height: 15,),
          Icon(
            Icons.swap_vert,
            color: Colors.white,
            size: 35,
          ),
          SizedBox(height: 15,),
          Text(
            "GED",
            style: TextStyle(
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
