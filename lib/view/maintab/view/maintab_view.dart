import 'package:eksi_sozluk/core/network/vexana_manager.dart';
import 'package:eksi_sozluk/view/home/login/view/login_view.dart';
import 'package:eksi_sozluk/view/home/popular/view/popular_view.dart';

import 'package:eksi_sozluk/view/home/title/view/title_view.dart';
import 'package:eksi_sozluk/view/maintab/service/maintab_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../viewmodel/maintab_view_model.dart';

class MainTabView extends StatelessWidget {
  MainTabView({Key? key}) : super(key: key);

  final ctrl = Get.put(
      MainTabViewModel(MainTabService(VexanaManager.instance.networkManager)));

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainTabViewModel>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
            child: IndexedStack(
          index: ctrl.tabIndex,
          children: [
            TitleView(),
            PopularView(),
            PopularView(),
            LoginView(),
          ],
        )),
        bottomNavigationBar: getBottomNavigationBar(context),
      );
    });
  }

  getBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar( 
  type: BottomNavigationBarType.fixed, // Fixed 
  backgroundColor: Colors.black, 
      elevation: 10.0,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined,
                color: Colors.grey.shade400, size: 30),
            activeIcon: Icon(
              Icons.receipt_long_outlined,
              color: Colors.green,
              size: 30,
            ),
            label: 'gündem'),
        BottomNavigationBarItem(
            icon: Icon(Icons.history_toggle_off,
                color: Colors.grey.shade400, size: 30),
            activeIcon: Icon(
              Icons.history_toggle_off,
              color: Colors.green,
              size: 30,
            ),
            label: 'populer'),
        BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.grey.shade400, size: 30),
            activeIcon: Icon(
              Icons.search,
              color: Colors.green,
              size: 30,
            ),
            label: 'ara'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.grey.shade400, size: 30),
            activeIcon: Icon(
              Icons.person,
              color: Colors.green,
              size: 30,
            ),
            label: 'kullanıcı'),
      ],
      currentIndex: ctrl.tabIndex,
      onTap: ctrl.changeTabIndex,
      selectedItemColor: Colors.green,
      showSelectedLabels: true,
    );
  }
}
