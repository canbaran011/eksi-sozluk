import '../model/title_detail_model.dart';
import '../model/title_model.dart';
import '../service/title_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TitleViewModel extends GetxController {
  final ITitleService titleService;
  TitleViewModel(this.titleService);

  var isLoading = false.obs;
  var titleList = <TitleModel>[].obs;
  var titleDetail = TitleDetailModel();
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
      //print('DETAIL==========================');
      final response = await titleService.fetchTitleDetail(slug.value);
      if (response != null) {
        titleDetail = response;
      } else {
        Get.snackbar('Error', 'There are some errors',
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    }
    changeLoading();
  }

  Future<void> getDebeItems() async {
    changeLoading();
    final response = await titleService.fetchDebeItems();
    if (response != null) {
      titleList.value = response;
    } else {
      Get.snackbar('Error', 'There are some errors',
          backgroundColor: Colors.red, colorText: Colors.white);
    }

    changeLoading();
  }
}
