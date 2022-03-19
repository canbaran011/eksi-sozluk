import 'package:get_storage/get_storage.dart';
import 'package:vexana/vexana.dart';

class VexanaManager {
  static VexanaManager? _instance;
  final box = GetStorage();
  static VexanaManager get instance {
    if (_instance != null) return _instance!;
    _instance = VexanaManager._init();
    return _instance!;
  }

  // static const String _iosBaseUrl = '';
  // static const String _androidBaseUrl = '';

  VexanaManager._init();

  INetworkManager networkManager = NetworkManager(
    isEnableLogger: true,
    onRefreshFail: () {
      print('ON REFRESH FAIL');
    },
    interceptor: InterceptorsWrapper(onError: (DioError e, handler) async {
      //FILE LOGGER FOR ERRORS WILL BE COME

      print('NETWORK MANAGER ERROR HAPPENED');

      return handler.next(e);
    }),
    options: BaseOptions(
      baseUrl: 'https://api.eksisozluk.com', 
      headers: {
      'Host': 'api.eksisozluk.com',
      'User-Agent': 'okhttp/3.12.1',
      'Connection': 'close',
      'Api-Secret':'68f779c5-4d39-411a-bd12-cbcc50dc83dd',
      'Accept-Encoding': 'gzip, deflate',
      'Content-Type': 'application/x-www-form-urlencoded' //maybe not here on spesific reqeust
    }),
  );
}
