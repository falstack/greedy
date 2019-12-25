import 'package:dio/dio.dart';

BaseOptions options = new BaseOptions(
  baseUrl: "https://api.calibur.tv/",
  connectTimeout: 5000,
  receiveTimeout: 3000,
);

Dio dio = new Dio(options)
  ..interceptors.add(
    InterceptorsWrapper(
      onRequest: (RequestOptions options) {
        if (options.data is Map) {
          options.data = options.data.map((key, value){
            if (value is String) {
              return MapEntry(key, value.trim());
            }
            return MapEntry(key, value);
          });
        }
        print(options.headers);
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
      return response;
    } catch (e) {
      return e;
    }
  }
}
