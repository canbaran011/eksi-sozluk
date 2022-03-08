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

class TitleService extends ITitleService with NetworkHelper {
  TitleService(INetworkManager networkManager) : super(networkManager);

  @override
  Future<List<TitleModel>?> fetchTitleListService() async {
    final response = await networkManager.send<TitleModel, List<TitleModel>>(
        'https://eksisozluk-api-f.herokuapp.com/api/basliklar',
        parseModel: TitleModel(),
        method: RequestType.GET);

    return response.data ?? [];
  }

  @override
  Future<TitleDetailModel?> fetchTitleDetail(String slug) async {
    final response =
        await networkManager.send<TitleDetailModel, TitleDetailModel>(
            'https://eksisozluk-api-f.herokuapp.com/api/baslik' + slug,
            parseModel: TitleDetailModel(),
            method: RequestType.GET);

    return response.data;
  }


}
