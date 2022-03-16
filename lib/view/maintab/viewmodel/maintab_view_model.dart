import 'package:eksi_sozluk/view/maintab/service/maintab_service.dart';
import 'package:get/get.dart';

class MainTabViewModel extends GetxController {
  final IMainTabService mainTabService;
  MainTabViewModel(this.mainTabService);

  var tabIndex = 0;
  var isLoading = false.obs;

  void changeTabIndex(int index) {
    
    tabIndex = index;
    update();
  }

  Future<void> getAnonymousAccessToken() async {
    final response = mainTabService.fetchAuthToken();
  }
}
