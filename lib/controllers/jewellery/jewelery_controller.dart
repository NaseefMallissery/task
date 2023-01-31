
import 'package:flutter/cupertino.dart';
import 'package:infinity_box_assignment/controllers/jewellery/jewelery_service.dart';
import 'package:infinity_box_assignment/model/jewelery_model/jewelery_model.dart';

class JeweleryController with ChangeNotifier {
  JeweleryController() {
    callAllFunctions();
  }

  List<JeweleryModel> jeweleryList = [];
  bool loading = false;

  void callAllFunctions() {
    getAllProducts();
  }

  void getAllProducts() async {
    await JeweleryService().getAllJewelery().then(
      (value) {
        if (value != null) {
          jeweleryList = value;
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

  bool _isSelected = false;

  bool get isSelected => _isSelected;

  set isSelected(
    bool value,
  ) {
    _isSelected = value;
    notifyListeners();
  }
}
