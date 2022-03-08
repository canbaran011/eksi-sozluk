import 'package:auto_size_text/auto_size_text.dart';
import '../../../../core/network/vexana_manager.dart';
import '../model/title_model.dart';
import '../service/title_service.dart';
import 'title_detail_view.dart';
import '../viewmodel/title_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TitleView extends StatelessWidget {
  TitleView({Key? key}) : super(key: key);

  final ctrl = Get.put(
      TitleViewModel(TitleService(VexanaManager.instance.networkManager)));

  @override
  Widget build(BuildContext context) {
    ctrl.getTitleItems();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.green,
          title: Text('EKSISOZLUK'),
        ),
        body: buildObservableBody(context));
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
                        style: TextStyle(fontSize: 16),
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
                child: Scrollbar(
                  isAlwaysShown: true,
                  radius: Radius.circular(50),
                  thickness: Get.width * 0.02,
                  child: ListView.builder(
                      itemCount: ctrl.titleList.length,
                      itemBuilder: (context, index) {
                        var person = ctrl.titleList[index];
                        return getCardListWidget(context, person);
                      }),
                ),
              ));
  }

  Widget getCardListWidget(BuildContext context, TitleModel title) {
    return Card(
      color: Colors.grey[850],
      child: Column(
        children: <Widget>[
          ListTile(
            onTap: () async {
              ctrl.slug.value = title.slug!;
              ctrl.getTitleDetail();
              Get.to(TitleDetailView());
            },
            isThreeLine: true,
            leading: Icon(
              Icons.book,
              color: Colors.green,
            ),
            title: AutoSizeText(title.title ?? '',
                maxLines: 2, style: TextStyle(color: Colors.white38)),
            subtitle: Text(title.entryCount ?? ''),
          ),
        ],
      ),
    );
  }
}
