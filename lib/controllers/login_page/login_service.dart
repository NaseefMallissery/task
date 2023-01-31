
import 'package:dio/dio.dart';
import 'package:infinity_box_assignment/helpers/utils/app_exeptions.dart';

class LoginService {
  Future<String?> login(String username, String password) async {
    final dio = Dio();
    try {
      final response =
          await dio.post('https://fakestoreapi.com/auth/login', data: {
        "username": username,
        "password": password,
      });

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return response.data['token'];
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }
}
