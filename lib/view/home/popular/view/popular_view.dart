import 'package:auto_size_text/auto_size_text.dart';
import 'package:eksi_sozluk/core/network/vexana_manager.dart';
import 'package:eksi_sozluk/view/home/popular/model/popular_model.dart';

import 'package:eksi_sozluk/view/home/popular/service/popular_service.dart';
import 'package:eksi_sozluk/view/home/popular/viewmodel/popular_view_model.dart';
import 'package:eksi_sozluk/view/home/title/model/topic.dart';
import 'package:eksi_sozluk/view/home/titledetail/view/titledetail_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularView extends StatelessWidget {
  PopularView({Key? key}) : super(key: key);
  final ctrl = Get.put(
      PopularViewModel(PopularService(VexanaManager.instance.networkManager)));

  @override
  Widget build(BuildContext context) {
    ctrl.getPopularItems();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text('popüler'),
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
          backgroundColor: Colors.grey,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
        )),
      );

  buildListBody(BuildContext context) {
    return Container(
      color: Colors.black54,
      alignment: Alignment.center,
      width: Get.width,
      height: Get.height,
      child: ctrl.popularList.isEmpty
          ? RefreshIndicator(
              onRefresh: () async {
                await ctrl.getPopularItems();
              },
              child: Stack(
                children: <Widget>[
                  ListView(),
                  Center(
                      child: Text(
                    'Populer listeniz yok !',
                    maxLines: 1,
                  ))
                ],
              ),
            )
          : RefreshIndicator(
              onRefresh: () async {
                await ctrl.getPopularItems();
              },
              child: ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: ctrl.popularList.length,
                  itemBuilder: (context, index) {
                    var model = ctrl.popularList[index];
                    return getCardWidget(context, model);
                  }),
            ),
    );
  }

  getCardWidget(BuildContext context, PopularTopic model) {
    return Card(
      color: Colors.grey,
      child: Column(
        children: <Widget>[
          ListTile(
            onTap: () async {
              Get.to(TitleDetailView(
                topicId: model.topicId.toString(),
              ));
            },
            isThreeLine: true,
            leading: Icon(
              Icons.star,
              color: Colors.yellow.shade900,
            ),
            title: AutoSizeText(
              model.title ?? 'icerik eksik',
              maxFontSize: 15,
              minFontSize: 10,
              maxLines: 2,
              style: TextStyle(color: Colors.white38),
            ),
            subtitle: Text(''),
          )
        ],
      ),
    );
  }
}
