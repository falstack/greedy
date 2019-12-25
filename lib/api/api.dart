import 'package:dio/dio.dart';

BaseOptions options = new BaseOptions(
  baseUrl: "https://api.calibur.tv/",
  connectTimeout: 5000,
  receiveTimeout: 3000,
);

Dio dio = new Dio(options);

dio.interceptors.add(
  InterceptorsWrapper(
    onRequest: (RequestOptions options) {
      return options;
    },
    onResponse: (Response response) {
      return response;
    },
    onError: (DioError e) {
      return  e;
    }
  )
);

class Api {
  accessLogin(String username, String password) async {
    try {
      Response response = await dio.post(
        "v1/door/login",
        data: {
          "access": username,
          "secret": password
        }
      );
      print(response);
      return response;
    } catch (e) {
      print('error handle');
      print(e.response.data);
      print(e.response.headers);
      print(e.response.request);
      print(e.request);
      print(e.message);
    }
  }
}
