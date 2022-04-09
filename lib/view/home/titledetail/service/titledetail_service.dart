import 'package:eksi_sozluk/core/network/network_helper.dart';
import 'package:eksi_sozluk/view/home/titledetail/model/titledetail_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vexana/vexana.dart';

abstract class ITitleDetailService {
  INetworkManager networkManager;
  ITitleDetailService(this.networkManager);

  Future<TitleDetailModel?> fetchTitleDetails(String topicId,int pageNumber);
}

class TitleDetailService extends ITitleDetailService with NetworkHelper {
  TitleDetailService(INetworkManager networkManager) : super(networkManager);
  final box = GetStorage();


  @override
  Future<TitleDetailModel?> fetchTitleDetails(String topicId, int pageNumber) async {
    final response = await networkManager
        .send<TitleDetailModel, TitleDetailModel>('/v2/topic/' + topicId + '/?p='+ pageNumber.toString() ,
            parseModel: TitleDetailModel(),
            method: RequestType.GET,
            options: Options(headers: {
              'Client-Secret': box.read('csecret'),
          'ClientUniqueId': box.read('cunique'),
          'Authorization': 'Bearer ' + box.read('jwt')}));

    return response.data;
  }
}
