import 'package:flutter/material.dart';
import 'package:infinity_box_assignment/helpers/routers/route_name.dart';
import 'package:infinity_box_assignment/model/single_product_model/product_id_model.dart';
import 'package:infinity_box_assignment/view/cart_page/cart_page.dart';
import 'package:infinity_box_assignment/view/home_page/home_page.dart';
import 'package:infinity_box_assignment/view/login_page/login_page.dart';
import 'package:infinity_box_assignment/view/product_view_page/product_view_page.dart';
import 'package:infinity_box_assignment/view/search/search_page.dart';

class AppRoutes {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.loginSceen:
        return MaterialPageRoute(
          builder: (context) => const LoginPAge(),
        );
      case RouteNames.productView:
        final args = settings.arguments as ProductIdModel;
        return MaterialPageRoute(
          builder: (context) => ProductViewPage(
            productId: args.productId.toString(),
          ),
        );
      case RouteNames.homePage:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case RouteNames.search:
        return MaterialPageRoute(
          builder: (context) => const SearchScreen(),
        );
      case RouteNames.cartPage:
        return MaterialPageRoute(
          builder: (context) => const CartPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
    }
  }
}

class Route {}
