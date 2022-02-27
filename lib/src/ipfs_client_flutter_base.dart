// TODO: Put public facing types in this file.

import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import 'ipfs_service.dart';

/// Checks if you are awesome. Spoiler: you are.
class IpfsClient {
  String? url = 'http://127.0.0.1:5001';
  final IpfsService _ipfsService = IpfsService();

  IpfsClient({this.url});

  Future<dynamic> mkdir(String path) async {
    if(!path.startsWith("/")) path = "/$path";
    var params = {
      'arg': path,
    };
    try {
      var response = await _ipfsService.post(
          url: '$url/api/v0/files/write?',
          params: params,
          authorizationToken:
              "dTB4NGpvYzJrcDpDSFZGQWdSMU9xSW5GOC13UzA5MmRjQThXZUhqTy1VOW5GcHU4bW8xMnpF");
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
