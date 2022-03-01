import 'package:eksi_sozluk/view/home/title/model/title_model.dart';
import 'package:eksi_sozluk/view/home/title/service/title_service.dart';
import 'package:get/get.dart';

class TitleViewModel extends GetxController {
  final ITitleService titleService;
  TitleViewModel(this.titleService);

  var isLoading = false.obs;
  var titleList = <TitleModel>[].obs;

  void changeLoading() {
    isLoading.value = !isLoading.value;
  }


  Future<void> getTitleItems()async {

  }


}
