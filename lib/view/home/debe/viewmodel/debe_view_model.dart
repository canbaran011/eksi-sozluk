// import 'package:eksi_sozluk/view/home/debe/service/debe_service.dart';
// import 'package:eksi_sozluk/view/home/title/model/title_detail_model.dart';
// import 'package:eksi_sozluk/view/home/title/model/title_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class DebeViewModel extends GetxController {
//   final IDebeService debeService;
//   DebeViewModel(this.debeService);

//   var isLoading = false.obs;
//   var slug = ''.obs;

//   var debeList = <TitleModel>[].obs;
//   var debeDetail = TitleDetailModel();

//   void changeLoading() {
//     isLoading.value = !isLoading.value;
//   }

//   Future<void> getDebeItems() async {
//     // changeLoading();
//     // final response = await debeService.fetchDebeItems();
//     // // if (response != null) {
//     //   //debeList.value = response!;
//     //    //print(response.first.title);
//     // // } else {
//     // //   Get.snackbar("Error", "You have some errors",
//     // //       backgroundColor: Colors.red, colorText: Colors.white);
//     // // }
//     // changeLoading();
//   }

//   Future<void> getDebeDetail() async {
//     // changeLoading();
//     // if (slug.isNotEmpty) {
//     //   final response = await debeService.fetchDebeDetail(slug.value);
//     //   if (response != null) {
//     //     debeDetail = response;
//     //   } else {
//     //     Get.snackbar("Error", "Response is NULL OMG !",
//     //         backgroundColor: Colors.red, colorText: Colors.white);
//     //   }
//     // } else {
//     //   Get.snackbar("Error", "You have some errors",
//     //       backgroundColor: Colors.red, colorText: Colors.white);
//     // }
//     // changeLoading();
//   }
// }
