import 'package:eksi_sozluk/core/network/network_helper.dart';
import 'package:eksi_sozluk/view/home/title/model/title_detail.dart';
import 'package:eksi_sozluk/view/home/title/model/title_model.dart';
import 'package:vexana/vexana.dart';

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
        'http://e1ad-31-223-84-172.ngrok.io/api/basliklar',
        parseModel: TitleModel(),
        method: RequestType.GET);

    return response.data ?? [];
  }

  @override
  Future<TitleDetailModel?> fetchTitleDetail(String slug) async {
    final response =
        await networkManager.send<TitleDetailModel, TitleDetailModel>(
            'http://e1ad-31-223-84-172.ngrok.io/api/baslik' + slug,
            parseModel: TitleDetailModel(),
            method: RequestType.GET);

    return response.data;
  }
}
