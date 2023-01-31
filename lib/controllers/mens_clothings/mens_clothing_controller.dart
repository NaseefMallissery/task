import 'package:flutter/cupertino.dart';
import 'package:infinity_box_assignment/controllers/mens_clothings/mens_clothings_services.dart';
import 'package:infinity_box_assignment/model/mens_clothing/mens_clothing.dart';

class MensController with ChangeNotifier {
  MensController() {
    callAllFunctions();
  }

  List<MensClothingModel> mensList = [];
  bool loading = false;

  void callAllFunctions() {
    getAllProducts();
    
  }  bool _isSelected = false;

  bool get isSelected => _isSelected;

  set isSelected(
    bool value,
  ) {
    _isSelected = value;
    notifyListeners();
  }

  void getAllProducts() async {
    await MensClothingsService().getAllMens().then(
      (value) {
        if (value != null) {
          mensList = value;

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
