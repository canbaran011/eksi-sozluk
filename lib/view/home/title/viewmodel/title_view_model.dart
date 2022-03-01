import 'package:eksi_sozluk/view/home/title/model/title_detail.dart';
import 'package:eksi_sozluk/view/home/title/model/title_model.dart';
import 'package:eksi_sozluk/view/home/title/service/title_service.dart';
import 'package:get/get.dart';

class TitleViewModel extends GetxController {
  final ITitleService titleService;
  TitleViewModel(this.titleService);

  var isLoading = false.obs;
  var titleList = <TitleModel>[].obs;
  TitleDetailModel? titleDetail;
  var slug = ''.obs;

  void changeLoading() {
    isLoading.value = !isLoading.value;
  }

  Future<void> getTitleItems() async {
    changeLoading();
    final response = await titleService.fetchTitleListService();
    titleList.value = response!;
    changeLoading();
  }

  Future<void> getTitleDetail() async {
    changeLoading();
    if (slug.isNotEmpty) {
      final response = await titleService.fetchTitleDetail(slug.value);
    }
    changeLoading();
  }
}
