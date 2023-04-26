import 'package:bloggios_mart/Common/Widgets/bottom-bar.dart';
import 'package:bloggios_mart/Features/Auth/Screens/auth-screen.dart';
import 'package:bloggios_mart/Features/Home/Screens/home-screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const AuthScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      );
      case BottomBar.routeName:
      return MaterialPageRoute(
        builder: (_) => const BottomBar(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text("Screen does not Exist"),
          ),
        ),
      );
  }
}
