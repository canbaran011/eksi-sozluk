import 'package:eksi_sozluk/core/network/network_helper.dart';
import 'package:vexana/vexana.dart';

abstract class ITitleService {
  INetworkManager networkManager;
  ITitleService(this.networkManager);

  Future<void> fetchTitleListService();
}

class TitleService extends ITitleService with NetworkHelper {
  TitleService(INetworkManager networkManager) : super(networkManager);

  @override
  Future<void> fetchTitleListService() {
    // TODO: implement fetchTitleListService
    throw UnimplementedError();
  }
  
}
