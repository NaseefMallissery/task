import 'package:flutter/cupertino.dart';
import 'package:infinity_box_assignment/controllers/electronics/electronics_service.dart';
import 'package:infinity_box_assignment/model/electronics/electronic_model.dart';

class ElectronicsController with ChangeNotifier {
  ElectronicsController() {
    callAllFunctions();
  }
  void callAllFunctions() {
    getAllProducts();
  }

  List<ElectronicsModel> electronicsList = [];
  bool loading = false;
  bool _isSelected = false;

  bool get isSelected => _isSelected;

  set isSelected(
    bool value,
  ) {
    _isSelected = value;
    notifyListeners();
  }

  void getAllProducts() async {
    await ElectronicsService().getAllElectronics().then(
      (value) {
        if (value != null) {
          electronicsList = value;

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
