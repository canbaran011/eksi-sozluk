
import 'package:eksi_sozluk/core/network/network_helper.dart';
import 'package:eksi_sozluk/view/maintab/model/auth_model.dart';
import 'package:vexana/vexana.dart';

abstract class IMainTabService {
  INetworkManager networkManager;
  IMainTabService(this.networkManager);

  Future<void> fetchAuthToken();
}

class MainTabService extends IMainTabService with NetworkHelper {
  MainTabService(INetworkManager networkManager) : super(networkManager);

  
  // final box = GetStorage();
  @override
  Future<void> fetchAuthToken() async {
    final response = await networkManager.send<AuthModel,AuthModel>(
        'https://api.eksisozluk.com/v2/account/anonymoustoken',
        parseModel: AuthModel(),
        method: RequestType.POST,
        options: Options(headers: {'Content-Length': '184'}),
        data: {
          'Platform': 'g',
          'Version': '2.0.0',
          'Build': '51',
          'Api-Secret': '68f779c5-4d39-411a-bd12-cbcc50dc83dd',
          'Client-Secret': 'eabb8841-258d-4561-89a6-66c6501dee83',
          'ClientUniqueId': '1a62383d-742e-4bcf-bf77-2fe1a1edcd39'
        });

    print(response.data);
    try {
      if (response.error == null) {
        print('=====================================');
        print(response.data?.success ?? 'BOS BOS BOS');
      } else {
         print(response.data?.success ?? 'INSIDE ELSE BOS BOS BOS');
        //Get.snackbar('Error', 'Cant get auth token');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}



    // final Response response = await dio.post(
    //   'https://api.eksisozluk.com/v2/account/anonymoustoken',
    //   data: {
    //     'Platform': 'g',
    //     'Version': '2.0.0',
    //     'Build': '51',
    //     'Api-Secret': '68f779c5-4d39-411a-bd12-cbcc50dc83dd',
    //     'Client-Secret': 'eabb8841-258d-4561-89a6-66c6501dee83',
    //     'ClientUniqueId': '1a62383d-742e-4bcf-bf77-2fe1a1edcd39',
    //   },
    //   options:
    //       Options(contentType: Headers.formUrlEncodedContentType, headers: {
    //     'Host': 'api.eksisozluk.com',
    //     'User-Agent': 'okhttp/3.12.1',
    //     'Connection': 'close',
    //     'Accept-Encoding': 'gzip, deflate',
    //     'Content-Type': 'application/x-www-form-urlencoded'
    //   }),
    // );