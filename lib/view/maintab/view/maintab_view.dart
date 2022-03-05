import 'package:eksi_sozluk/view/home/suser/suser_vier.dart';
import 'package:eksi_sozluk/view/home/title/view/title_view.dart';
import 'package:eksi_sozluk/view/maintab/viewmodel/maintab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainTabView extends StatelessWidget {
  MainTabView({Key? key}) : super(key: key);

  final ctrl = Get.put(MainTabViewModel());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainTabViewModel>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
            child: IndexedStack(
          index: ctrl.tabIndex,
          children: [
            TitleView(),
            SuserView(),
            SuserView(),
            SuserView(),
          ],
        )),
        bottomNavigationBar: getBottomNavigationBar(context),
        
      );
    });
  }

  getBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black38,
      elevation: 15.0,      
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined,
                color: Colors.grey.shade400, size: 30),
            activeIcon: Icon(
              Icons.receipt_long_outlined,
              color: Colors.green,
              size: 30,
            ),
            label: 'başlık'),
        BottomNavigationBarItem(
            icon: Icon(Icons.history_toggle_off,
                color: Colors.grey.shade400, size: 30),
            activeIcon: Icon(
              Icons.history_toggle_off,
              color: Colors.green,
              size: 30,
            ),
            label: 'debe'),
        BottomNavigationBarItem(
            icon: Icon(Icons.search,
                color: Colors.grey.shade400, size: 30),
            activeIcon: Icon(
              Icons.search,
              color: Colors.green,
              size: 30,
            ),
            label: 'ara'),
        BottomNavigationBarItem(
            icon: Icon(Icons.wb_sunny,
                color: Colors.grey.shade400, size: 30),
            activeIcon: Icon(
              Icons.wb_sunny,
              color: Colors.green,
              size: 30,
            ),
            label: 'baslik4'),
      ],
      currentIndex: ctrl.tabIndex,
      onTap: ctrl.changeTabIndex,
      selectedItemColor: Colors.green,
      showSelectedLabels: true,
    );
  }
}
