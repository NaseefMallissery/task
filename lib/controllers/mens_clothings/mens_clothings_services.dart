import 'package:dio/dio.dart';
import 'package:infinity_box_assignment/helpers/constant/api_endepoints.dart';
import 'package:infinity_box_assignment/helpers/constant/api_url.dart';
import 'package:infinity_box_assignment/helpers/utils/app_exeptions.dart';
import 'package:infinity_box_assignment/model/mens_clothing/mens_clothing.dart';

class MensClothingsService{

Future<List<MensClothingModel>?>getAllMens()async{
    Dio dio = Dio();
    try {
      final Response response =
          await dio.get(ApiUrl.badeUrl + ApiEndPoints.mensClothings);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final List<MensClothingModel> allMens = (response.data as List)
            .map((e) => MensClothingModel.fromJson(e))
            .toList();
        return allMens;
      } else {
        return null;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
}

}
