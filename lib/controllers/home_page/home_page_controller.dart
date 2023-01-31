import 'package:flutter/cupertino.dart';

class HomePageController with ChangeNotifier {
  // bool loading = false;
  // bool isMaxScroll = false;
  // List<AllProductsModel> productsList = [];
  // int limit = 6;

  // void getAllProductsWithLimit(limit) async {
  //   loading = true;
  //   notifyListeners();
  //   await HomeService().limitedProduct(limit.toString()).then(
  //     (value) {
  //       if (value != null) {
  //         productsList = value;
  //         notifyListeners();
  //         loading = false;
  //         notifyListeners();
  //       } else {
  //         loading = false;
  //         notifyListeners();
  //         null;
  //       }
  //     },
  //   );
  // }

  // void scrollListener(
  //   ScrollController scrollController,
  // ) async {
  //   if (scrollController.position.pixels ==
  //       scrollController.position.maxScrollExtent) {
  //     limit = limit + 6;
  //     notifyListeners();

  //     getAllProductsWithLimit(limit);
  //     notifyListeners();
  //     log('scroll');
  //   }
  // }

}
