import 'package:get/get.dart';

class MainTabViewModel extends GetxController {
  var tabIndex = 0;
  var isLoading = false.obs;

  void changeTabIndex(int index) {
    //print('CLICKEDDDDDDD');
    tabIndex = index;
    update();
  }
}
