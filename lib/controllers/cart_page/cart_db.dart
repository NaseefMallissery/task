import 'package:hive_flutter/adapters.dart';
import 'package:infinity_box_assignment/model/cart_model/cart_model.dart';

class DBFunctions {
  static List<CartModel> carttList = [];

  Future<List<CartModel>> addToCart(CartModel value) async {
    final cartDB = await Hive.openBox<CartModel>('CartModelDB');
    await cartDB.put(value.id, value);
    carttList.add(value);
    return carttList;
  }

  Future<List<CartModel>> getAllCart() async {
    final cartDB = await Hive.openBox<CartModel>('CartModelDB');
    carttList.clear();
    carttList.addAll(cartDB.values);
    return carttList;
  }

  Future<List<CartModel>> deleteFromCart(id) async {
    final cartDB = await Hive.openBox<CartModel>('CartModelDB');
    await cartDB.delete(id);
    carttList.clear();
    carttList.addAll(cartDB.values);
    return carttList;
  }

  // Future<void> updateStudent(String id, CartModel value) async {
  //   final cartDB = await Hive.openBox<CartModel>('CartModelDB');
  //   cartDB.put(id, value);
  // }
}
