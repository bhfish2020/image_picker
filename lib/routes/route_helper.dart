import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../pages/home/home_page.dart';



class RouteHelper{
  final goRouterProvider = Provider<GoRouter>((ref) {
    return GoRouter(
      routes: routes,
    );
  });




  static const String splashScreen = "/splash-screen";
  static const String initial = "/";
  static const String signIn = "/sign-in";
  static const String signUp = "/sign-up";
  static const String welcome = "/welcome-page";

  //make one for home
  static String getSplashScreen()=> '$splashScreen';
  static String getWelcomePage()=> '$welcome';
  static String getInitial() => '$initial';
  static String getSignInPage()=> '$signIn';
  static String getSignUpPage()=> '$signUp';

  static List<GoRoute> routes = [
    GoRoute(path: initial, pageBuilder: (context, state) {
      return MaterialPage(child: HomePage());
    }),
    ///Remove When adding cap
    ///GoRoute(path: welcome, pageBuilder: (context, state) {
    ///  return MaterialPage(child: WelcomePage());
    ///}),
    ///GoRoute(path: signIn, pageBuilder: (context, state) {
    ///  return MaterialPage(child: SignInPage());
    ///}),
    ///GoRoute(path: signUp, pageBuilder: (context, state) {
    ///  return MaterialPage(child: SignUpPage());
    ///}),
    ///GoRoute(path: splashScreen, pageBuilder: (context, state) {
    ///  return MaterialPage(child: SplashScreen());
    ///})
  ];

}