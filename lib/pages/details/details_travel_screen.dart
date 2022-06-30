import 'package:demo_app/pages/places/select_place_screen.dart';
import 'package:demo_app/routes/route_helper.dart';
import 'package:demo_app/utils/colors.dart';
import 'package:demo_app/utils/dimensions.dart';
import 'package:demo_app/widget/app_icon.dart';
import 'package:demo_app/widget/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsTravelScreen extends StatelessWidget {
  const DetailsTravelScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
         var data = Get.arguments;
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(icon: Icons.clear)
                ),
                GestureDetector(
                  onTap: (){
                    
                  },
                  child: AppIcon(icon: Icons.shopping_cart_outlined)
                )
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                // margin: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20)
                  ),
                  color: Colors.white,
                ),
                child: Center(
                  child: BigText(
                    text: "Titre du voyage", 
                    size: Dimensions.font26
                  )
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                 "assets/images/car.png",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.height20),
              child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")),
              
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.height20*2.5, vertical: Dimensions.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(backgroundColor: AppColors.mainColor, iconSize: Dimensions.iconSize24, iconColor: Colors.white, icon: Icons.remove),
                BigText(text: "3500 \Fcfa " + " X " + " 1 ", color: AppColors.mainBlackColor, size: Dimensions.font20,),
                AppIcon(backgroundColor: AppColors.mainColor, iconSize: Dimensions.iconSize24, iconColor: Colors.white, icon: Icons.add)
              ],
            ),
          ),
          Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.symmetric(vertical: Dimensions.height20, horizontal: Dimensions.height10),
            decoration: BoxDecoration(
              color: AppColors.bottonBackgrounColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20),
                topRight: Radius.circular(Dimensions.radius20)
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: Dimensions.height20, horizontal: Dimensions.height20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: AppColors.mainColor,
                  )
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(SelectPlaceScreen());
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: Dimensions.height20, horizontal: Dimensions.height20),
                    child: BigText(
                      text: "3500 \Fcfa | Ajouter", color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.mainColor
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}