import 'package:eksi_sozluk/core/network/network_manager.dart';
import 'package:vexana/vexana.dart';

import '../../../../core/network/network_helper.dart';
import '../model/title_detail_model.dart';
import '../model/title_model.dart';

abstract class ITitleService {
  INetworkManager networkManager;
  ITitleService(this.networkManager);

  Future<List<TitleModel>?> fetchTitleListService();
  Future<TitleDetailModel?> fetchTitleDetail(String slug);
  
}

class TitleService extends ITitleService  {
  TitleService(INetworkManager networkManager) : super(networkManager);

  

  @override
  Future<List<TitleModel>?> fetchTitleListService() async {
     final response = await networkManager.send<TitleModel, List<TitleModel>>(
        '/api/basliklar',
        parseModel: TitleModel(),
        method: RequestType.GET);

    return response.data ?? [];
  }

  @override
  Future<TitleDetailModel?> fetchTitleDetail(String slug) async {
    
  }


}
