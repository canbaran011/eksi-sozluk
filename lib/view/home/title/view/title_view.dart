import 'package:auto_size_text/auto_size_text.dart';
import 'package:eksi_sozluk/core/network/network_manager.dart';
import 'package:eksi_sozluk/view/home/title/model/topic.dart';
import 'package:eksi_sozluk/view/home/titledetail/view/titledetail_view.dart';
import 'package:eksi_sozluk/view/maintab/service/maintab_service.dart';
import 'package:eksi_sozluk/view/maintab/viewmodel/maintab_view_model.dart';
import '../../../../core/network/vexana_manager.dart';
import '../model/title_model.dart';
import '../service/title_service.dart';
import '../viewmodel/title_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TitleView extends StatelessWidget {
  TitleView({Key? key}) : super(key: key);

  final ctrl = Get.put(
      TitleViewModel(TitleService(VexanaManager.instance.networkManager)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.green,
          title: Text('ekşisözlük'),
        ),
        body: buildObservableBody(context));
  }

  buildObservableBody(BuildContext context) {
    ctrl.getTitleItems();
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
          backgroundColor: Colors.grey,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
        )),
      );

  buildListBody(BuildContext context) {
    var refreshKey = GlobalKey<RefreshIndicatorState>();
    return Container(
        color: Colors.black,
        alignment: Alignment.center,
        height: Get.height,
        child: ctrl.titleList.isEmpty
            ? RefreshIndicator(
                onRefresh: () async {
                  await ctrl.getTitleItems();
                },
                child: Stack(
                  children: <Widget>[
                    ListView(),
                    Center(
                      child: Text(
                        'no title',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              )
            : RefreshIndicator(
                key: refreshKey,
                onRefresh: () async {
                  await ctrl.getTitleItems();
                },
                child: ListView.builder(
                    itemCount: ctrl.titleList.length,
                    itemBuilder: (context, index) {
                      var title = ctrl.titleList[index];
                      return getCardListWidget(context, title);
                    }),
              ));
  }

  Widget getCardListWidget(BuildContext context, Topic title) {
    return Card(
      color: Colors.grey[850],
      child: Column(
        children: <Widget>[
          ListTile(
            onTap: () async {
              Get.to(TitleDetailView(
                topicId: title.topicId.toString(),
              ));
            },
            isThreeLine: true,
            leading: Icon(
              Icons.book,
              color: Colors.green,
            ),
            title: AutoSizeText(title.title ?? '',maxFontSize: 15,minFontSize: 10,
                maxLines: 2, style: TextStyle(color: Colors.white38)),
            subtitle: Text(title.day ?? ''),
          ),
        ],
      ),
    );
  }
}
