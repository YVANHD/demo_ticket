
import 'package:demo_app/pages/compte/account_screen.dart';
import 'package:demo_app/pages/dashboard/dashboard_screen.dart';
import 'package:demo_app/pages/home/home_screen.dart';
import 'package:demo_app/utils/colors.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

List pages = [
   HomeScreen(),
  Container(
    child: Center(child: Text("Next 1 pages")),
  ),
  DashboardScreen(),
  AccountScreen(),
];

void onTapNav(int index) {
  setState(() {
    _selectedIndex = index;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: AppColors.mainBlackColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        currentIndex: _selectedIndex,
        onTap: onTapNav,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: "Itineraires"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive),
            label: "historique"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Achats"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Moi"
          ),
        ],
      ),
    );
  }
}