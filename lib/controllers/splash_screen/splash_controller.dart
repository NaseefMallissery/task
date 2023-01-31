import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:infinity_box_assignment/helpers/routers/route_name.dart';

class SplashController with ChangeNotifier {
  FlutterSecureStorage storage = const FlutterSecureStorage();

  String? logInValue;

  void splash(context) async {
    await Future.delayed(
      const Duration(seconds: 4),
    );
    logInValue = await storage.read(key: 'Token');

    if (logInValue != null) {
      Navigator.pushNamedAndRemoveUntil(
          context, RouteNames.homePage, (route) => false);
    } else if(logInValue == null) {
      Navigator.pushNamedAndRemoveUntil(
          context, RouteNames.loginSceen, (route) => false);
    }
  }
}
