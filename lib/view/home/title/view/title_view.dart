import 'package:eksi_sozluk/core/constants/app_constants.dart';
import 'package:eksi_sozluk/core/network/vexana_manager.dart';
import 'package:eksi_sozluk/view/home/title/model/title_model.dart';
import 'package:eksi_sozluk/view/home/title/service/title_service.dart';
import 'package:eksi_sozluk/view/home/title/viewmodel/title_view_model.dart';
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
        title: Text('EKSISOZLUK'),
      ),
      body: buildObservableBody(context),
    );
  }

  buildObservableBody(BuildContext context) {
    return Obx(() =>
        ctrl.isLoading.value ? buildCenterLoading() : buildListBody(context));
  }

  buildCenterLoading() => Center(child: CircularProgressIndicator.adaptive());

  buildListBody(BuildContext context) {
    var refreshKey = GlobalKey<RefreshIndicatorState>();
    return Container(
        alignment: Alignment.center,
        height: Get.height * 0.78,
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
                        'noPerson'.tr,
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
                  radius: Radius.circular(50),
                  thickness: Get.width * 0.02,
                  child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
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
      child: Column(
        children: <Widget>[
          ListTile(
            onTap: () async {},
            isThreeLine: true,
            leading: Icon(
              Icons.person,
              color: AppColors.appBlue,
            ),
            title: Text(title.title ?? ''),
            subtitle: Text(title.entryCount ?? ''),
          ),
        ],
      ),
    );
  }
}
