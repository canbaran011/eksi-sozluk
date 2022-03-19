import 'package:eksi_sozluk/core/network/network_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vexana/vexana.dart';

import '../../../../core/network/network_helper.dart';

import '../model/title_model.dart';

abstract class ITitleService {
  INetworkManager networkManager;
  ITitleService(this.networkManager);

  Future<TitleModel?> fetchTitleListService();
  
}

class TitleService extends ITitleService {
  TitleService(INetworkManager networkManager) : super(networkManager);

  final box = GetStorage();

  @override
  Future<TitleModel?> fetchTitleListService() async {
    final response = await networkManager.send<TitleModel, TitleModel>(
        '/v2/index/today/?p=1',
        options: Options(headers: {
          'Client-Secret': box.read('csecret'),
          'ClientUniqueId': box.read('cunique'),
          'Authorization': 'Bearer ' + box.read('jwt')
        }),
        parseModel: TitleModel(),
        method: RequestType.GET);

    return response.data;
  }

  // @override
  // Future<TitleDetailModel?> fetchTitleDetail(String slug) async {

  // }

}
