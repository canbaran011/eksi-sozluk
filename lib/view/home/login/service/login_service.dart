import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:eksi_sozluk/core/network/network_helper.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart' as g;
import 'package:get_storage/get_storage.dart';
import 'package:uuid/uuid.dart';
import 'package:vexana/vexana.dart';

abstract class ILoginService {
  INetworkManager networkManager;
  ILoginService(this.networkManager);

  Future<void> sendLoginService(String username, String password);
}

class LoginService extends ILoginService with NetworkHelper {
  LoginService(INetworkManager networkManager) : super(networkManager);
  final box = GetStorage();
  @override
  Future<void> sendLoginService(String username, String password) async {
    Response response;
    var dio = Dio();
    var uuid = Uuid();
    String v1 = uuid.v1();
    box.write('csecret', v1);
    String v2 = uuid.v1();
    box.write('cunique', v2);
    response = await dio.post('https://api.eksisozluk.com/Token',
        data: {
          'username': username,
          'password': password,
          'Platform': 'g',
          'Version': '2.0.0',
          'grant_type': 'password',
          'Build': '51',
          'Api-Secret': '68f779c5-4d39-411a-bd12-cbcc50dc83dd',
          'Client-Secret': v1,
          'ClientUniqueId': v2
        },
        options:
            Options(contentType: Headers.formUrlEncodedContentType, headers: {
          'Host': 'api.eksisozluk.com',
          'User-Agent': 'okhttp/3.12.1',
          'Connection': 'close',
          'Content-Length': '264',
          'Accept-Encoding': 'gzip, deflate',
          'Content-Type': 'application/x-www-form-urlencoded'
        }));

    try {
      if (response.statusCode == 200) {
      } else if (response.statusCode == 400) {
        var error = jsonEncode(response.data);
        Map<String, dynamic> errorModel = jsonDecode(error);

        var errorMessage = errorModel['error_description'].toString();
        g.Get.snackbar("ERROR", errorMessage ,backgroundColor: Colors.red );
      }
    } catch (e) {
      print(e);
      g.Get.snackbar("ERROR", e.toString() ,backgroundColor: Colors.red );
    }
    // return response.data;
  }
}

//  final response = await networkManager.send<LoginModel, LoginModel>('/Token',
//         parseModel: LoginModel(),
//         method: RequestType.POST,
//         data: {
//           'username': username,
//           'password': password,
//           'Platform': 'g',
//           'Version': '2.0.0',
//           'grant_type': 'password',
//           'Build': '51',
//           'Api-Secret': '68f779c5-4d39-411a-bd12-cbcc50dc83dd',
//           'Client-Secret': box.read('csecret'),
//           'ClientUniqueId': box.read('cunique')
//         });
