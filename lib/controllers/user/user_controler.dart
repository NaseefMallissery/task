import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:infinity_box_assignment/helpers/routers/route_name.dart';

class UserController with ChangeNotifier{
  logout(context) async{
  final storage = const FlutterSecureStorage();
await  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('Log Out'),
      content: const Text('Do you want to Logout?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async{
            await  storage.deleteAll();
            Navigator.pushNamedAndRemoveUntil(
                context, RouteNames.loginSceen, (route) => false);
          
          },
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
}
