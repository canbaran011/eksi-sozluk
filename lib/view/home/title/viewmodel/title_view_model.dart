import 'package:eksi_sozluk/view/home/title/model/topic.dart';
import '../service/title_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TitleViewModel extends GetxController {
  final ITitleService titleService;
  TitleViewModel(this.titleService);

  var isLoading = false.obs;
  var titleList = <Topic>[].obs;
  //var titleDetail = TitleDetailModel();
  var slug = ''.obs;

  void changeLoading() {
    isLoading.value = !isLoading.value;
  }

  Future<void> getTitleItems() async {
    changeLoading();
    final response = await titleService.fetchTitleListService();
    if (response != null && response.data?.topics != null) {
      titleList.value = response.data!.topics!;
    } else {
      Get.snackbar("Error", "Some backend errors happened ! ", backgroundColor: Colors.red);
    }
    changeLoading();
  }

  // Future<void> getTitleDetail() async {
  //   changeLoading();
  //   if (slug.isNotEmpty) {

  //     final response = await titleService.fetchTitleDetail(slug.value);
  //     if (response != null) {
  //       titleDetail = response;
  //     } else {
  //       Get.snackbar('Error', 'There are some errors',
  //           backgroundColor: Colors.red, colorText: Colors.white);
  //     }
  //   }
  //   changeLoading();
  // }

}
