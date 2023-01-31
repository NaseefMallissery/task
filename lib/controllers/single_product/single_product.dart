import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:infinity_box_assignment/helpers/routers/route_name.dart';

import '../../model/all_products/all_products_model.dart';
import '../all_products/all_product_service.dart';

class SingleProductController with ChangeNotifier {
  SingleProductController() {
    log("constructer call");
    loadingStarted();
  }
  bool loading = false;
  AllProductsModel? product;

  void productDetails(productId) async {
    loading = true;
    notifyListeners();
    await AllProductService().getOneProduct(productId).then((value) {
      if (value != null) {
        product = value;
        notifyListeners();
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
      }
    });
  }

  void loadingStarted() {
    log('laoding');
    loading = true;
    notifyListeners();
  }

  void goToCart(BuildContext context) {
    Navigator.of(context).pushNamed(RouteNames.cartPage);
  }
}
