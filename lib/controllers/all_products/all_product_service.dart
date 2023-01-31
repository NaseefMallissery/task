import 'package:dio/dio.dart';
import 'package:infinity_box_assignment/helpers/constant/api_endepoints.dart';
import 'package:infinity_box_assignment/helpers/constant/api_url.dart';
import 'package:infinity_box_assignment/helpers/utils/app_exeptions.dart';
import 'package:infinity_box_assignment/model/all_products/all_products_model.dart';

class AllProductService {
  Future<List<AllProductsModel>?> getAllProducts() async {
    Dio dio = Dio();
    try {
      final Response response =
          await dio.get(ApiUrl.badeUrl + ApiEndPoints.products);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final List<AllProductsModel> allProducts = (response.data as List)
            .map((e) => AllProductsModel.fromJson(e))
            .toList();
        return allProducts;
      } else {
        return null;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<AllProductsModel?> getOneProduct(String productId) async {
    Dio dio = Dio();
    try {
      final Response response =
          await dio.get('${ApiUrl.badeUrl + ApiEndPoints.products}/$productId');
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final AllProductsModel product =
            AllProductsModel.fromJson(response.data);
        return product;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }
}
