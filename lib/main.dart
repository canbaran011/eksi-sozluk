import 'package:eksi_sozluk/view/home/title/view/title_view.dart';
import 'package:eksi_sozluk/view/maintab/service/maintab_service.dart';
import 'package:eksi_sozluk/view/maintab/viewmodel/maintab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'core/lang/app_translations.dart';
import 'core/network/vexana_manager.dart';
import 'view/maintab/view/maintab_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await _init();

  runApp(GetEksiApp());
}

_init() async {
  final mainCTRL = Get.put(
      MainTabViewModel(MainTabService(VexanaManager.instance.networkManager)));
  await mainCTRL.getAnonymousAccessToken();
}

class GetEksiApp extends StatelessWidget {
  GetEksiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eksisozluk',
      translationsKeys: AppTranslations.translationKeys,
      locale: const Locale('tr', 'TR'),
      fallbackLocale: Get.deviceLocale,
      enableLog: true,
      navigatorKey: Get.key,
      navigatorObservers: [GetObserver()],
      theme: ThemeData(
        scrollbarTheme: const ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(Colors.green[500]),
        ),
        primarySwatch: Colors.blue,
      ),
      home: MainTabView(),
    );
  }
}
