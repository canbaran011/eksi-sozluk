// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:eksi_sozluk/core/network/network_manager.dart';
// import '../../../../core/extensions/context_extension.dart';
// import '../../../../core/network/vexana_manager.dart';
// import '../model/entries.dart';
// import '../service/title_service.dart';
// import '../viewmodel/title_view_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class TitleDetailView extends StatelessWidget {
//   TitleDetailView({Key? key}) : super(key: key);

//   final ctrl = Get.put(
//       TitleViewModel(TitleService(NetworkManager.instance!)));

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: Text('Detail'),
//           centerTitle: true,
//           backgroundColor: Colors.green),
//       body: getObservableList(context),
//     );
//   }

//   getObservableList(BuildContext context) {
//     return Obx(() =>
//         ctrl.isLoading.value ? buildCenterLoading() : buildListBody(context));
//   }

//   buildCenterLoading() => Container(
//       alignment: Alignment.center,
//       color: Colors.grey[800],
//       width: Get.width,
//       height: Get.height * 0.9,
//       child: Center(
//           child: CircularProgressIndicator.adaptive(
//         valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
//       )));

//   buildListBody(BuildContext context) {
//     var refreshKey = GlobalKey<RefreshIndicatorState>();
//     return Column(
//       children: [
//         Container(
//           margin: context.paddingLow,
//           child: AutoSizeText(
//             ctrl.titleDetail.title ?? 'loading title',
//             maxLines: 2,
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//         ),
//         Container(
//             color: Colors.black,
//             alignment: Alignment.center,
//             height: Get.height * 0.85,
//             child: ctrl.titleDetail.entries!.isEmpty
//                 ? RefreshIndicator(
//                     onRefresh: () async {
//                       await ctrl.getTitleDetail();
//                     },
//                     child: Stack(
//                       children: <Widget>[
//                         ListView(),
//                         Center(
//                           child: Text(
//                             'no title detail',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(fontSize: 16),
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 : RefreshIndicator(
//                     key: refreshKey,
//                     onRefresh: () async {
//                       await ctrl.getTitleDetail();
//                     },
//                     child: Scrollbar(
//                       isAlwaysShown: true,
//                       radius: Radius.circular(50),
//                       thickness: Get.width * 0.02,
//                       child: ListView.builder(
//                           physics: const AlwaysScrollableScrollPhysics(),
//                           itemCount: ctrl.titleDetail.entries?.length,
//                           itemBuilder: (context, index) {
//                             var titleDetail = ctrl.titleDetail.entries![index];
//                             return getCardListWidget(context, titleDetail);
//                           }),
//                     ),
//                   )),
//       ],
//     );
//   }

//   getCardListWidget(BuildContext context, Entries titleDetail) {
//     return Card(
//       color: Colors.grey[800],
//       child: Column(
//         children: [
//           ListTile(
//             title: Text(titleDetail.body ?? 'loading'),
//             subtitle: Text(
//               titleDetail.author ?? '',
//               textAlign: TextAlign.right,
//             ),
//           ),
//           Container(
//             alignment: Alignment.center,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(titleDetail.favCount ?? '0'),
//                 Text(titleDetail.createdAt ?? 'tarih')
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
