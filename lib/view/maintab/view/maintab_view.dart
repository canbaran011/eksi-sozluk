import 'package:eksi_sozluk/view/home/title/view/title_view.dart';
import 'package:eksi_sozluk/view/maintab/viewmodel/maintab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainTabView extends GetView<MainTabViewModel> {
  MainTabView({Key? key}) : super(key: key);

  final ctrl = Get.put(MainTabViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildObserverBuildBody(context),
      bottomNavigationBar: getBottomNavigationBar(context),
    );
  }

  getBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined,
                color: Colors.grey.shade400, size: 30),
            activeIcon: Icon(
              Icons.receipt_long_outlined,
              color: Colors.green,
              size: 30,
            ),
            label: 'baslik'),
        BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined,
                color: Colors.grey.shade400, size: 30),
            activeIcon: Icon(
              Icons.receipt_long_outlined,
              color: Colors.green,
              size: 30,
            ),
            label: 'baslik'),
        BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined,
                color: Colors.grey.shade400, size: 30),
            activeIcon: Icon(
              Icons.receipt_long_outlined,
              color: Colors.green,
              size: 30,
            ),
            label: 'baslik'),
        BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined,
                color: Colors.grey.shade400, size: 30),
            activeIcon: Icon(
              Icons.receipt_long_outlined,
              color: Colors.green,
              size: 30,
            ),
            label: 'baslik'),
      ],
      currentIndex: ctrl.tabIndex.value,
      onTap: (newIndex) {
        ctrl.changeTabIndex(newIndex);
      },
      selectedItemColor: Colors.green,
      showSelectedLabels: true,
    );
  }

  buildObserverBuildBody(BuildContext context) {
    return Obx(() => ctrl.isLoading.value ? buildCenterLoading() : getTab());
  }

  Center buildCenterLoading() =>
      Center(child: CircularProgressIndicator.adaptive());

  getTab() {
    
    switch (ctrl.tabIndex.value) {
      case :
        
        break;
      default:
    }
  }
}
