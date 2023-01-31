import 'package:flutter/material.dart';
import 'package:infinity_box_assignment/controllers/login_page/login_controller.dart';
import 'package:infinity_box_assignment/helpers/constant/app_styles.dart';
import 'package:infinity_box_assignment/helpers/utils/loading_widget.dart';
import 'package:infinity_box_assignment/view/login_page/widget/Cutom_input_field.dart';
import 'package:provider/provider.dart';

class LoginPAge extends StatelessWidget {
  const LoginPAge({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController =
        Provider.of<LoginController>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .2,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                   
                    const Text(
                      'Welcome..',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold),
                    ),
                    Text('Login To Continue!...',style: TextStyle(
                          fontSize: 22,
                          color: Colors.purple[800],
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomInputField(
                      hintText: 'User Name',
                      autoFocus: false,
                      obscureText: false,
                      iconData: Icons.mail_outline,
                      controller: loginController.nameController,
                      validator: (value) =>
                          loginController.nameValidation(value),
                    ),
                    AppSIzedBoxes.kHeight20,
                    Consumer<LoginController>(
                      builder: (context, value, child) {
                        return CustomInputField(
                          autoFocus: false,
                          hintText: 'Password',
                          obscureText: value.passwordHidden,
                          iconData: Icons.lock_outline,
                          controller: loginController.passwordController,
                          validator: (value) =>
                              loginController.passwordValidation(value),
                          suffixIcon: InkWell(
                            onTap: value.togglePassword,
                            child: value.passwordHidden
                                ? const Icon(
                                    Icons.visibility,
                                    color: AppColors.greyColor,
                                  )
                                : const Icon(
                                    Icons.visibility_off,
                                    color: AppColors.greyColor,
                                  ),
                          ),
                        );
                      },
                    ),
                    AppSIzedBoxes.kHeight30,
                    Consumer<LoginController>(builder: (context, value, _) {
                      return value.loading == true
                          ? const LoadingWidget()
                          : ElevatedButton(
                              onPressed: () {
                                value.login(context);
                              },
                              child: const Text("Login"));
                    })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
