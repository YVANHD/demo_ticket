
import 'package:demo_app/pages/home/home_screen.dart';
import 'package:demo_app/pages/splash/splash_screen.dart';
import 'package:demo_app/pages/welcome/welcome_screen.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String splashPage = "/splash";
  static const String initial = "/";
  static const String home = "/home";

  static String getInitial() => initial;
  static String getSplashPage() => splashPage;
   static String getHome() => home;

  static List<GetPage>  routes = [
    GetPage(name: splashPage, page: () =>  SplashScreen()),
    GetPage(name: initial, page: () =>  WelcomeScreen()),
    GetPage(name: home, page: () =>  HomeScreen()),

  ];
}

