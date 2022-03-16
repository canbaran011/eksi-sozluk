// @override
//   Future<void> fetchAuthToken() async {
//     Response response = await networkManager.dio.post(
//         '/v2/account/anonymoustoken',
//         options: Options(headers: {'Content-Length': '184'}),
//         data: {
//           'Platform': 'g',
//           'Version': '2.0.0',
//           'Build': '51',
//           'Api-Secret': '68f779c5-4d39-411a-bd12-cbcc50dc83dd',
//           'Client-Secret': 'eabb8841-258d-4561-89a6-66c6501dee83',
//           'ClientUniqueId': '1a62383d-742e-4bcf-bf77-2fe1a1edcd39'
//         });
//     print(response.statusCode);
//     print(response.data);
//     try {
//       if (response.statusCode == 200) {
//         print('=====================================');
//         var model = AuthModel.fromJson(response.data);
//         print(model.success.toString());
//       } else {
//         //Get.snackbar('Error', 'Cant get auth token');
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }