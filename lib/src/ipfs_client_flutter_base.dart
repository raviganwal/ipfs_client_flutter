// TODO: Put public facing types in this file.

import 'package:dio/dio.dart';
import 'ipfs_service.dart';

/// Checks if you are awesome. Spoiler: you are.
class IpfsClient {
  String? url;
  String? authorizationToken;
  final IpfsService _ipfsService = IpfsService();

  IpfsClient({this.url = 'http://127.0.0.1:5001', this.authorizationToken});

  /// Make a directory in IPFS
  /// For more: https://docs.ipfs.io/reference/http/api/#api-v0-files-mkdir
  Future<dynamic> mkdir({required String dir}) async {
    if (!dir.startsWith("/")) dir = "/$dir";
    var params = {
      'arg': dir,
    };
    try {
      var response = await _ipfsService.post(
          url: '$url/api/v0/files/mkdir?',
          queryParameters: params,
          authorizationToken: authorizationToken);
      return response;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        return e.response?.data;
      }
    }
  }

  /// List directories in the local mutable namespace.
  /// For more: https://docs.ipfs.io/reference/http/api/#api-v0-files-ls
  Future<dynamic> ls({String? dir = "/"}) async {
    if (dir != null && !dir.startsWith("/")) dir = "/$dir";
    var params = {
      'arg': dir,
      'long': true,
      'U': true,
    };
    try {
      var response = await _ipfsService.post(
          url: '$url/api/v0/files/ls?',
          queryParameters: params,
          authorizationToken: authorizationToken);
      return response;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        return e.response?.data;
      }
    }
  }

  /// List directories in the local mutable namespace.
  /// For more: https://docs.ipfs.io/reference/http/api/#api-v0-files-ls
  Future<dynamic> stat(
      {String? dir = "/", Map<String, dynamic> params = const {}}) async {
    if (dir != null && !dir.startsWith("/")) dir = "/$dir";
    var _params = {'arg': dir, ...params};
    try {
      var response = await _ipfsService.post(
          url: '$url/api/v0/files/stat?',
          queryParameters: _params,
          authorizationToken: authorizationToken);
      return response;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        return e.response?.data;
      }
    }
  }

  /// Write to a file in a given filesystem.
  /// For more: https://docs.ipfs.io/reference/http/api/#api-v0-files-write
  Future<dynamic> write(
      {required String dir,
      required String filePath,
      String fileName = ""}) async {
    if (!dir.startsWith("/")) dir = "/$dir";
    var params = {
      'arg': dir,
      'create': true,
    };
    try {
      var response = await _ipfsService.postFile(
          url: '$url/api/v0/files/write?',
          formData: await getFormData(filePath, fileName),
          queryParameters: params,
          authorizationToken: authorizationToken);
      return response;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        return e.response?.data;
      }
    }
  }

  String checkDir(String dir) {
    if (!dir.startsWith("/")) return dir = "/$dir";
    return dir;
  }

  Future<FormData> getFormData(String filePath, String fileName) async {
    return FormData.fromMap({
      'file': await MultipartFile.fromFile(
        filePath,
        filename: fileName,
      ),
    });
  }
}
