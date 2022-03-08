import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/lang/app_translations.dart';
import 'view/maintab/view/maintab_view.dart';

void main() {
  
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const GetEksiApp());
}


class GetEksiApp extends StatelessWidget {
  const GetEksiApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eksisozluk',
      translationsKeys:AppTranslations.translationKeys ,
      locale: const Locale('tr','TR'),
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

