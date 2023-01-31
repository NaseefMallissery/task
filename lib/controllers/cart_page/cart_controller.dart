
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:infinity_box_assignment/controllers/cart_page/cart_db.dart';
import 'package:infinity_box_assignment/model/cart_model/cart_model.dart';

class CartController with ChangeNotifier {
  CartController() {
    getCart();
  }

  List<CartModel> cartList = [];
  bool loading = false;
  String? price;
  double totalAmount = 0;
  List<String> cartIds = [];
  void getCart() async {
    loading = true;
    notifyListeners();
    await DBFunctions().getAllCart().then((value) {
      cartList = value;
      notifyListeners();
      priceCalculate();
      loading = false;
      notifyListeners();
    });
  }

  void addToCart(CartModel value) async {
    loading = true;
    notifyListeners();
    await DBFunctions().addToCart(value).then((value) {
      cartList = value;
      notifyListeners();
      priceCalculate();
      Fluttertoast.showToast(
          msg: 'Added to Cart', backgroundColor: Colors.green);
      loading = false;
      notifyListeners();
    });
  }

  void deleteFromCart(String itemId) async {
    loading = true;
    notifyListeners();
    await DBFunctions().deleteFromCart(itemId).then((value) {
      cartList = value;
      notifyListeners();
      Fluttertoast.showToast(
          msg: 'Item removed from cart', backgroundColor: Colors.red);
      priceCalculate();
      loading = false;
      notifyListeners();
    });
  }

  void priceCalculate() {
    totalAmount = 0;
    cartIds.clear();
    notifyListeners();
    for (int i = 0; i < cartList.length; i++) {
      totalAmount = totalAmount + cartList[i].price;
      notifyListeners();
      cartIds.add(cartList[i].id);
      notifyListeners();
    }
    price = totalAmount.toString();
    notifyListeners();
  }
}
