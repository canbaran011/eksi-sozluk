import 'package:eksi_sozluk/view/maintab/service/maintab_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainTabViewModel extends GetxController {
  final IMainTabService mainTabService;
  MainTabViewModel(this.mainTabService);

  var tabIndex = 0;
  var isLoading = false.obs;
  final box = GetStorage();

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  Future<void> getAnonymousAccessToken() async {
    final response = await mainTabService.fetchAuthToken();
    // if (response != null) {
    //   if (response.data != null) {
    //   print('---------------------------------');
    //   print(response.data?.accessToken ?? 'NO ACCESS TOKEN');
    //     String token = response.data!.accessToken!;
    //     box.write('jwt', token);
    //   } else {
    //     Get.snackbar(
    //         "Error", "Some MainTabService Error \n Response DATA is null",backgroundColor: Colors.red);
    //   }
    // } else {
    //   Get.snackbar("Error", "Some MainTabService Error \nResponse is NULL",backgroundColor: Colors.red);
    // }
  }
}
