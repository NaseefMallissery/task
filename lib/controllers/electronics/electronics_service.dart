import 'package:dio/dio.dart';
import 'package:infinity_box_assignment/helpers/constant/api_endepoints.dart';
import 'package:infinity_box_assignment/helpers/constant/api_url.dart';
import 'package:infinity_box_assignment/helpers/utils/app_exeptions.dart';
import 'package:infinity_box_assignment/model/electronics/electronic_model.dart';

class ElectronicsService{

Future<List<ElectronicsModel>?>getAllElectronics()async{
    Dio dio = Dio();
    try {
      final Response response =
          await dio.get(ApiUrl.badeUrl + ApiEndPoints.electronics);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final List<ElectronicsModel> allElectronics = (response.data as List)
            .map((e) => ElectronicsModel.fromJson(e))
            .toList();
        return allElectronics;
      } else {
        return null;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
}

}
