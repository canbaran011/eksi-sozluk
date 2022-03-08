import 'package:eksi_sozluk/core/network/network_helper.dart';
import 'package:eksi_sozluk/view/home/title/model/title_detail_model.dart';
import 'package:eksi_sozluk/view/home/title/model/title_model.dart';
import 'package:vexana/vexana.dart';

abstract class IDebeService {
  INetworkManager networkManager;
  IDebeService(this.networkManager);

  Future<List<TitleModel>?> fetchDebeItems();
  Future<TitleDetailModel?> fetchDebeDetail(String slug);

}

class DebeService extends IDebeService with NetworkHelper {
  DebeService(INetworkManager networkManager) : super(networkManager);

  @override
  Future<List<TitleModel>?> fetchDebeItems()async {
    final response = await networkManager.send<TitleModel, List<TitleModel>>(
        'https://eksisozluk-api-f.herokuapp.com/api/debe',
        parseModel: TitleModel(),
        method: RequestType.GET);

    return response.data ?? [];
  }

  @override
  Future<TitleDetailModel?> fetchDebeDetail(String slug) async{
    final response =
        await networkManager.send<TitleDetailModel, TitleDetailModel>(
            'https://eksisozluk-api-f.herokuapp.com/api/baslik' + slug,
            parseModel: TitleDetailModel(),
            method: RequestType.GET);

    return response.data;
  }
  
}
