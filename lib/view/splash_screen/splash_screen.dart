import 'package:flutter/material.dart';
import 'package:infinity_box_assignment/controllers/splash_screen/splash_controller.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final splashProvider =
        Provider.of<SplashController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      splashProvider.splash(context);
    });
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SizedBox(
        height: MediaQuery.of(context).size.height/1.1,
        width: double.infinity,
        child: const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              Colors.deepPurple,
            ),
          ),
        ),
      ),
    );
  }
}
