import 'package:flutter/cupertino.dart';
import 'package:infinity_box_assignment/controllers/all_products/all_product_service.dart';
import 'package:infinity_box_assignment/helpers/routers/route_name.dart';
import 'package:infinity_box_assignment/helpers/utils/debouncer.dart';
import 'package:infinity_box_assignment/model/all_products/all_products_model.dart';
import 'package:infinity_box_assignment/model/single_product_model/product_id_model.dart';

class AllProductsController with ChangeNotifier {
  AllProductsController() {
    loadingStarted();
    callAllFunctions();
  }

  List<AllProductsModel> productsList = [];
  final debouncer = Debouncer(milliseconds: 200);
  List<AllProductsModel> foundProducts = [];

  bool loading = false;

  void callAllFunctions() {
    getAllProducts();
  }

  void getAllProducts() async {
    await AllProductService().getAllProducts().then(
      (value) {
        if (value != null) {
          productsList = value;
          notifyListeners();
          loading = false;
          notifyListeners();
        } else {
          loading = false;
          notifyListeners();
          null;
        }
      },
    );
  }

  void toProductScreen(context, productId) {
    final args = ProductIdModel(productId: productId);

    Navigator.of(context).pushNamed(
      RouteNames.productView,
      arguments: args,
    );
  }

  void loadingStarted() {
    loading = true;
    notifyListeners();
  }

  void toSearchScreen(BuildContext context) {
    Navigator.of(context).pushNamed(RouteNames.search);
  }

  Future<void> searchProducts(String text) async {
    loading = true;
    notifyListeners();
    if (text.isEmpty) {
      foundProducts = productsList;
      notifyListeners();
      loading = false;
      notifyListeners();
    } else {
      List<AllProductsModel> result = productsList
          .where((element) =>
              element.title.toLowerCase().contains(text.toLowerCase()) ||
              element.price.toString().contains(text) ||
              element.rating.toString().contains(text)
              ||element.category.toString().toLowerCase().contains(text))
          .toList();
      foundProducts = result;
      notifyListeners();
      loading = false;
      notifyListeners();
    }
  }

  void toCartScreen(BuildContext context) {
    Navigator.of(context).pushNamed(RouteNames.cartPage);
  }
}
