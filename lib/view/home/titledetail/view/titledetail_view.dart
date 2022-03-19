import 'package:auto_size_text/auto_size_text.dart';
import 'package:eksi_sozluk/core/network/vexana_manager.dart';
import 'package:eksi_sozluk/view/home/titledetail/model/entry.dart';
import 'package:eksi_sozluk/view/home/titledetail/service/titledetail_service.dart';
import 'package:eksi_sozluk/view/home/titledetail/viewmodel/titledetail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eksi_sozluk/core/extensions/context_extension.dart';
import 'package:intl/intl.dart';

class TitleDetailView extends StatelessWidget {
  TitleDetailView({Key? key, required this.topicId}) : super(key: key);
  final String topicId;

  final ctrl = Get.put(TitleDetailViewModel(
      TitleDetailService(VexanaManager.instance.networkManager)));

  @override
  Widget build(BuildContext context) {
    ctrl.getTitleDetail(topicId);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text('başlık'),
      ),
      body: buildObservableBody(context),
    );
  }

  buildObservableBody(BuildContext context) {
    return Obx(() =>
        ctrl.isLoading.value ? buildCenterLoading() : buildListBody(context));
  }

  buildCenterLoading() => Container(
      alignment: Alignment.center,
      color: Colors.grey[800],
      width: Get.width,
      height: Get.height * 0.9,
      child: Center(
          child: CircularProgressIndicator.adaptive(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
      )));

  buildListBody(BuildContext context) {
    var refreshKey = GlobalKey<RefreshIndicatorState>();
    return Column(
      children: [
        Container(
          margin: context.paddingLow,
          child: AutoSizeText(
            ctrl.topic ?? 'loading title',
            maxLines: 2,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
            color: Colors.black,
            alignment: Alignment.center,
            height: Get.height * 0.85,
            child: ctrl.entriesList.isEmpty
                ? RefreshIndicator(
                    onRefresh: () async {
                      await ctrl.getTitleDetail(topicId);
                    },
                    child: Stack(
                      children: <Widget>[
                        ListView(),
                        Center(
                          child: Text(
                            'no title detail',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  )
                : RefreshIndicator(
                    key: refreshKey,
                    onRefresh: () async {
                      await ctrl.getTitleDetail(topicId);
                    },
                    child: Scrollbar(
                      isAlwaysShown: true,
                      radius: Radius.circular(50),
                      thickness: Get.width * 0.02,
                      child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: ctrl.entriesList.length,
                          itemBuilder: (context, index) {
                            var titleDetail = ctrl.entriesList[index];
                            return getCardListWidget(context, titleDetail);
                          }),
                    ),
                  )),
      ],
    );
  }

  getCardListWidget(BuildContext context, Entry entry) {
    return Card(
      color: Colors.grey[800],
      child: Column(
        children: [
          ListTile(
            title: Text(entry.content ?? 'loading'),
            subtitle: Text(
              entry.author?.nick ?? '',
              textAlign: TextAlign.right,
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('fav = '+entry.favoriteCount.toString()),
                Text(getFormattedDate(entry.created!)),//entry.created ?? 'tarih'
              ],
            ),
          )
        ],
      ),
    );
  }

  String getFormattedDate(String created) {
    /// Convert into local date format.
  var localDate = DateTime.parse(created).toLocal();

  /// inputFormat - format getting from api or other func.
  /// e.g If 2021-05-27 9:34:12.781341 then format must be yyyy-MM-dd HH:mm
  /// If 27/05/2021 9:34:12.781341 then format must be dd/MM/yyyy HH:mm
  var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
  var inputDate = inputFormat.parse(localDate.toString());

  /// outputFormat - convert into format you want to show.
  var outputFormat = DateFormat('dd/MM/yyyy HH:mm');
  var outputDate = outputFormat.format(inputDate);

  return outputDate.toString();
  }
}
