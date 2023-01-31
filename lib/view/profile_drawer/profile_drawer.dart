import 'package:flutter/material.dart';
import 'package:infinity_box_assignment/controllers/user/user_controler.dart';
import 'package:infinity_box_assignment/helpers/constant/app_styles.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<UserController>(context);
    return Drawer(
      child: Column(children: [
        AppSIzedBoxes.kHeight30,
        // Text("User Name:$name"),
        IconButton(
            onPressed: () => controller.logout(context),
            icon: const Icon(Icons.logout))
      ]),
    );
  }
}
