import 'package:flutter/cupertino.dart';
import 'package:infinity_box_assignment/controllers/womens_cloth/womens_clothings_service.dart';
import 'package:infinity_box_assignment/model/womens_clothings/womens_clothing.dart';

class WomensController with ChangeNotifier {
  WomensController() {
    callAllFunctions();
  }

  List<WomensClothingModel> womensList = [];
  bool loading = false;

  void callAllFunctions() {
    getAllProducts();
  }

  bool _isSelected = false;

  bool get isSelected => _isSelected;

  set isSelected(
    bool value,
  ) {
    _isSelected = value;
    notifyListeners();
  }

  void getAllProducts() async {
    await WomensClothingService().getAllWomens().then(
      (value) {
        if (value != null) {
          womensList = value;

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
}
