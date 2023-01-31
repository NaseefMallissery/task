import 'package:dio/dio.dart';
import 'package:infinity_box_assignment/helpers/constant/api_endepoints.dart';
import 'package:infinity_box_assignment/helpers/constant/api_url.dart';
import 'package:infinity_box_assignment/helpers/utils/app_exeptions.dart';
import 'package:infinity_box_assignment/model/jewelery_model/jewelery_model.dart';

class JeweleryService{

Future<List<JeweleryModel>?>getAllJewelery()async{
    Dio dio = Dio();
    try {
      final Response response =
          await dio.get(ApiUrl.badeUrl + ApiEndPoints.jewelery);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final List<JeweleryModel> allJewelery = (response.data as List)
            .map((e) => JeweleryModel.fromJson(e))
            .toList();
        return allJewelery;
      } else {
        return null;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
}

}
