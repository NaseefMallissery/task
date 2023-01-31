import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:infinity_box_assignment/controllers/login_page/login_service.dart';
import 'package:infinity_box_assignment/helpers/routers/route_name.dart';

class LoginController with ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool passwordHidden = true;
  bool loading = false;
  FlutterSecureStorage storage = const FlutterSecureStorage();
  FlutterSecureStorage name = const FlutterSecureStorage();


  String? nameValidation(String? value) {

    if (value == null || value.isEmpty) {
      return 'Please enter your Name';
    } else if (value.length >= 4) {
      return 'Enter valid User name';
    } else {
      name.write(key: 'name', value: nameController.text);
      return null;
    }
  }

  String? passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the password';
    } else if (value.length < 6) {
      return 'The password must contain atleast 6 charactors';
    } else {
      return null;
    }
  }

  void togglePassword() {
    passwordHidden = !passwordHidden;
    notifyListeners();
  }

  void login(BuildContext context) async {
    loading = true;
    notifyListeners();
    await LoginService()
        .login(nameController.text, passwordController.text)
        .then((value) {
      if (value != null) {
        storage.write(key: 'Token', value: value);
        log(value.toString());
        Navigator.pushNamedAndRemoveUntil(
            context, RouteNames.homePage, (route) => false);
        loading = false;
        notifyListeners();
      } else {
        log('value null');
        loading = false;
        notifyListeners();
      }
    });
  }
}
