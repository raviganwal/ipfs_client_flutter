// TODO: Put public facing types in this file.
import 'package:dio/dio.dart';

/// Checks if you are awesome. Spoiler: you are.
class IpfsService {
  Dio dio = Dio();

  IpfsService() {
    dio.interceptors.add(LogInterceptor());
    //dio.interceptors.add(LogInterceptor(requestBody: true));
    // (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //     (HttpClient client) {
    //   client.findProxy = (uri) {
    //     //proxy all request to localhost:8888
    //     return 'PROXY localhost:8888';
    //   };
    //   client.badCertificateCallback =
    //       (X509Certificate cert, String host, int port) => true;
    // };
  }

  Future<dynamic> postFile(String url, var params, var authorizationToken) async {
    try {
      Response response = await dio.post(url,
          queryParameters: params,
          options: Options(
            headers: {
              "Authorization":
                  "Basic $authorizationToken",
              "Content-Disposition": "form-data",
            },
          ));
      return response.data;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        return e.response?.data;
      }
    }
  }


  Future<dynamic> post({String? url, var params, var authorizationToken}) async {
    try {
      Response response = await dio.post(url!,
          queryParameters: params,
          options: Options(
            headers: {
              "Authorization":
              "Basic $authorizationToken",
            },
          ));
      return response.data;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        return e.response?.data;
      }
    }
  }
}
