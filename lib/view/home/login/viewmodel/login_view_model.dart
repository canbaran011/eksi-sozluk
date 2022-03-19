import 'package:eksi_sozluk/view/home/login/service/login_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginViewModel extends GetxController {
  final ILoginService loginService;
  LoginViewModel(this.loginService);

  var isLoading = false.obs;
  var box = GetStorage();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  changeLoading() {
    isLoading.value = !isLoading.value;
  }

  Future<void> senLoginRequest() async {
    changeLoading();
    final response = await loginService.sendLoginService(
        phoneController.text, passwordController.text);
    // if (response != null) {
    //   Get.snackbar("DETAY", response.accessToken ?? "ACCESS TOKEN EMPTY",backgroundColor: Colors.green );
    // } else {
    //   Get.snackbar("ERROR", "SOME BACKEND ERROR");
    // }
    changeLoading();
  }
}
