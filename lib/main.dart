import 'package:bloggios_mart/Common/Widgets/bottom-bar.dart';
import 'package:bloggios_mart/Constants/themes.dart';
import 'package:bloggios_mart/Features/Auth/Screens/auth-screen.dart';
import 'package:bloggios_mart/Features/Auth/Services/auth-service.dart';
import 'package:bloggios_mart/Features/Home/Screens/home-screen.dart';
import 'package:bloggios_mart/Provider/user-provider.dart';
import 'package:bloggios_mart/Router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloggios Mart',
      debugShowCheckedModeBanner: false,
      theme: MyThemes.lightTheme(context),
      themeMode: ThemeMode.light,
      darkTheme: MyThemes.darkTheme(context),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? BottomBar()
          : AuthScreen(),
    );
  }
}
