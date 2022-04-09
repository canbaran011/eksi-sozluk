
import 'package:eksi_sozluk/view/home/popular/model/popular_model.dart';
import 'package:eksi_sozluk/view/home/popular/service/popular_service.dart';
import 'package:eksi_sozluk/view/home/title/model/topic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularViewModel extends GetxController {
  final IPopularService popularService;
  PopularViewModel(this.popularService);

  var isLoading = false.obs;
  var popularList = <PopularTopic>[].obs;

  void changeLoading() {
    isLoading.value = !isLoading.value;
  }

  Future<void> getPopularItems() async {
    //changeLoading();
    final response = await popularService.fetchPopularListService();
    if (response != null && response.data?.topics != null) {
      popularList.value = response.data!.topics!;
    } else {
      Get.snackbar("Error", "Some backend errors happened ! ",
          backgroundColor: Colors.red);
    }
    //changeLoading();
  }
}
