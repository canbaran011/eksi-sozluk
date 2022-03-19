import 'package:eksi_sozluk/view/home/titledetail/model/entry.dart';
import 'package:eksi_sozluk/view/home/titledetail/service/titledetail_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TitleDetailViewModel extends GetxController {
  final ITitleDetailService titleDetailService;
  TitleDetailViewModel(this.titleDetailService);

  var isLoading = false.obs;
  String? topic;
  
  var entriesList = <Entry>[].obs;

  changeLoading() {
    isLoading.value = !isLoading.value;
  }

  Future<void> getTitleDetail(String topicIdStr) async {
    changeLoading();
    final response = await titleDetailService.fetchTitleDetails(topicIdStr);
    if (response != null && response.data?.entries != null) {
      topic = response.data!.title!;
      entriesList.value = response.data!.entries!;
    } else {
      Get.snackbar("Error", "Some backend error ! ",
          backgroundColor: Colors.red);
    }

    changeLoading();
  }
}
