import 'package:dio/dio.dart';
import 'package:infinity_box_assignment/helpers/constant/api_endepoints.dart';
import 'package:infinity_box_assignment/helpers/constant/api_url.dart';
import 'package:infinity_box_assignment/helpers/utils/app_exeptions.dart';
import 'package:infinity_box_assignment/model/womens_clothings/womens_clothing.dart';

class WomensClothingService{

Future<List<WomensClothingModel>?>getAllWomens()async{
    Dio dio = Dio();
    try {
      final Response response =
          await dio.get(ApiUrl.badeUrl + ApiEndPoints.womensClothings);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final List<WomensClothingModel> allWomens = (response.data as List)
            .map((e) => WomensClothingModel.fromJson(e))
            .toList();
        return allWomens;
      } else {
        return null;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
}

}
