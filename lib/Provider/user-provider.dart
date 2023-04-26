import 'package:bloggios_mart/Models/User.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
      userId: '',
      name: '',
      email: '',
      password: '',
      address: '',
      type: '',
      token: '');

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}
