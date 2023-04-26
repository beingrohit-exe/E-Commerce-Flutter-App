// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:bloggios_mart/Common/Widgets/bottom-bar.dart';
import 'package:bloggios_mart/Constants/error-handling.dart';
import 'package:bloggios_mart/Constants/global-variables.dart';
import 'package:bloggios_mart/Constants/utils.dart';
import 'package:bloggios_mart/Features/Home/Screens/home-screen.dart';
import 'package:bloggios_mart/Models/Token.dart';
import 'package:bloggios_mart/Models/User.dart';
import 'package:bloggios_mart/Models/token-request.dart';
import 'package:bloggios_mart/Provider/user-provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  //SignUp User
  void signUpUser(
      {required BuildContext context,
      required String name,
      required String email,
      required String password}) async {
    try {
      User user = User(
          userId: '',
          name: name,
          email: email,
          password: password,
          address: '',
          type: '',
          token: '');

      http.Response response = await http.post(
        Uri.parse('$uri/auth/user'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8'
        },
      );
      print(response.body);
      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () {
          showSnackBar(
              context, 'Account created Login with the same credentials');
        },
      );
    } catch (e) {
      print(e.toString());
    }
  }

  void signInUser(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      TokenRequest tokenRequest =
          TokenRequest(email: email, password: password);

      http.Response response = await http.post(Uri.parse('$uri/auth/v1/login'),
          body: jsonEncode({'email': email, 'password': password}),
          headers: <String, String>{
            'Content-type': 'application/json; charset=UTF-8'
          });
      httpErrorHandle(
          response: response,
          context: context,
          onSuccess: () async {
            SharedPreferences preferences =
                await SharedPreferences.getInstance();

            //Everytime we have to put listen to false if are out of the build function
            Provider.of<UserProvider>(context, listen: false)
                .setUser(response.body);

            //Saving token in the local storage
            preferences.setString(
                'x-auth-token', jsonDecode(response.body)['token']);
            Navigator.pushNamedAndRemoveUntil(
                context, BottomBar.routeName, (route) => false);
          });
    } catch (e) {}
  }

  void getUserData(BuildContext context) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString('x-auth-token');
      if (token!.isEmpty) {
        preferences.setString('x-auth-token', '');
      }
      http.Response validatedTokenResponse = await http.get(
          Uri.parse('$uri/auth/v1/validate-token'),
          headers: <String, String>{
            'Content-type': 'application/json; charset=UTF-8',
            'Authorization': token
          });
      var tokenBody = jsonDecode(validatedTokenResponse.body);
      if (tokenBody == true) {
        //Getting User
        http.Response getUserDataResponse = await http.get(
          Uri.parse('$uri/user/me'),
          headers: <String, String>{
            'Content-type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token'
          },
        );
        Provider.of<UserProvider>(context, listen: false)
            .setUser(getUserDataResponse.body);
      }
    } catch (e) {}
  }
}
