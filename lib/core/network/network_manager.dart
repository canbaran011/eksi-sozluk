// import 'package:dio/dio.dart';

// class NetworkManager {
//   static NetworkManager? _instance;

//   static NetworkManager? get instance {
//     if (_instance != null) return _instance;
//     _instance = NetworkManager._init();
//     return _instance;
//   }

// //   static const String _iosBaseUrl = '';
// //   static const String _androidBaseUrl = '';
//   late Dio dio;
//   NetworkManager._init() {
//     final baseOptions = BaseOptions(
//         baseUrl: 'https://api.eksisozluk.com',
//         contentType: Headers.formUrlEncodedContentType,
//         headers: {
//           'Host': 'api.eksisozluk.com',
//           'User-Agent': 'okhttp/3.12.1',
//           'Connection': 'close',
//           'Accept-Encoding': 'gzip, deflate',
//         });
//     dio = Dio(baseOptions);
//   }
// }
