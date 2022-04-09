import 'package:eksi_sozluk/core/network/network_helper.dart';
import 'package:eksi_sozluk/view/home/popular/model/popular_model.dart';

import 'package:get_storage/get_storage.dart';
import 'package:vexana/vexana.dart';

abstract class IPopularService {
  INetworkManager networkManager;
  IPopularService(this.networkManager);

  Future<PopularModel?> fetchPopularListService();
}

class PopularService extends IPopularService with NetworkHelper {
  PopularService(INetworkManager networkManager) : super(networkManager);
  final box = GetStorage();
  @override
  Future<PopularModel?> fetchPopularListService() async {
    final response = await networkManager
        .send<PopularModel, PopularModel>('/v2/index/popular/?p=1',
            parseModel: PopularModel(),
            method: RequestType.POST,
            options: Options(headers: {
              'Client-Secret': box.read('csecret'),
              'ClientUniqueId': box.read('cunique'),
              'Authorization': 'Bearer ' + box.read('jwt')
            }),
            data: {
          {
            "Filters": [
              {"channelId": 1, "channelName": "spor", "enabled": true},
              {"channelId": 2, "channelName": "siyaset", "enabled": true},
              {"channelId": 4, "channelName": "anket", "enabled": true}
            ]
          }
        });
    print(response.data ?? 'empty');
    return response.data;
  }
}
