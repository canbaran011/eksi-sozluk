import 'package:get/get.dart';

class MainTabViewModel extends GetxController {
  var tabIndex = 0.obs;
  var isLoading = false.obs;

  changeTabIndex(int index) {
    tabIndex.value = index;
    update();
  }
}
