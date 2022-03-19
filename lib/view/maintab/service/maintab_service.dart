import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:eksi_sozluk/core/lang/app_translations.dart';
import 'package:eksi_sozluk/core/network/network_helper.dart';
import 'package:eksi_sozluk/view/maintab/model/auth_data.dart';
import 'package:eksi_sozluk/view/maintab/model/auth_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vexana/vexana.dart';

abstract class IMainTabService {
  INetworkManager networkManager;
  IMainTabService(this.networkManager);

  Future<void> fetchAuthToken();
}

class MainTabService extends IMainTabService with NetworkHelper {
  MainTabService(INetworkManager networkManager) : super(networkManager);

  final box = GetStorage();
  @override
  Future<void> fetchAuthToken() async {
    Response response;
    var dio = Dio();
    response = await dio.post(
      'https://api.eksisozluk.com/v2/account/anonymoustoken',
      data: {
        'Platform': 'g',
        'Version': '2.0.0',
        'Build': '51',
        'Api-Secret': '68f779c5-4d39-411a-bd12-cbcc50dc83dd',
        'Client-Secret': 'eabb8841-258d-4561-89a6-66c6501dee83',
        'ClientUniqueId': '1a62383d-742e-4bcf-bf77-2fe1a1edcd39',
      },
      options:
          Options(contentType: Headers.formUrlEncodedContentType, headers: {
        'Host': 'api.eksisozluk.com',
        'User-Agent': 'okhttp/3.12.1',
        'Connection': 'close',
        'Accept-Encoding': 'gzip, deflate',
        'Content-Type': 'application/x-www-form-urlencoded'
      }),
    );

    print(response.data);

    try {
      if (response.statusCode == 200) {
        print('=====================================');

        var user = jsonEncode(response.data);
        Map<String, dynamic> suser = jsonDecode(user);

        var jwtToken = suser['Data']['access_token'].toString();
        box.write('jwt', jwtToken);
        print(jwtToken);
      } else {
        print(response.data?.success ?? 'INSIDE ELSE BOS BOS BOS');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}


    //final response = await networkManager.send
    // (
    //     'https://api.eksisozluk.com/v2/account/anonymoustoken',
    //     parseModel: AuthModel(),
    //     method: RequestType.POST,
    //     options: Options(headers: {'Content-Length': '184'}),
    //     data: {
    //       'Platform': 'g',
    //       'Version': '2.0.0',
    //       'Build': '51',
    //       'Api-Secret': '68f779c5-4d39-411a-bd12-cbcc50dc83dd',
    //       'Client-Secret': 'eabb8841-258d-4561-89a6-66c6501dee83',
    //       'ClientUniqueId': '1a62383d-742e-4bcf-bf77-2fe1a1edcd39'
    //     });


