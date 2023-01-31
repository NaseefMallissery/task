import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:infinity_box_assignment/controllers/all_products/all_produts_controller.dart';
import 'package:infinity_box_assignment/controllers/cart_page/cart_controller.dart';
import 'package:infinity_box_assignment/controllers/electronics/electronic_controller.dart';
import 'package:infinity_box_assignment/controllers/home_page/home_page_controller.dart';
import 'package:infinity_box_assignment/controllers/jewellery/jewelery_controller.dart';
import 'package:infinity_box_assignment/controllers/login_page/login_controller.dart';
import 'package:infinity_box_assignment/controllers/mens_clothings/mens_clothing_controller.dart';
import 'package:infinity_box_assignment/controllers/single_product/single_product.dart';
import 'package:infinity_box_assignment/controllers/splash_screen/splash_controller.dart';
import 'package:infinity_box_assignment/controllers/user/user_controler.dart';
import 'package:infinity_box_assignment/controllers/womens_cloth/womens_controller.dart';
import 'package:infinity_box_assignment/helpers/routers/route_functions.dart';
import 'package:infinity_box_assignment/model/cart_model/cart_model.dart';
import 'package:infinity_box_assignment/view/home_page/home_page.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(CartModelAdapter().typeId)) {
    Hive.registerAdapter(CartModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AllProductsController()),
        ChangeNotifierProvider(create: (context) => HomePageController()),
        ChangeNotifierProvider(create: (context) => SingleProductController()),
        ChangeNotifierProvider(create: (context) => LoginController()),
        ChangeNotifierProvider(create: (context) => SplashController()),
        ChangeNotifierProvider(create: (context) => CartController()),
        ChangeNotifierProvider(create: (context) => JeweleryController()),
        ChangeNotifierProvider(create: (context) => MensController()),
        ChangeNotifierProvider(create: (context) => WomensController()),
        ChangeNotifierProvider(create: (context) => ElectronicsController()),
        ChangeNotifierProvider(create: (context) => UserController()),
      ],
      child: MaterialApp(
        title: 'Assignment',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        onGenerateRoute: (settings) => AppRoutes.generateRoute(settings),
        home: const HomePage(),
      ),
    );
  }
}
