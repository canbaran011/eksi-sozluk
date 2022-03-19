import 'package:eksi_sozluk/core/extensions/context_extension.dart';
import 'package:eksi_sozluk/core/network/vexana_manager.dart';
import 'package:eksi_sozluk/view/home/login/service/login_service.dart';
import 'package:eksi_sozluk/view/home/login/viewmodel/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final ctrl = Get.put(
      LoginViewModel(LoginService(VexanaManager.instance.networkManager)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text('giriş'),
      ),
      body: buildObservableBody(context),
      backgroundColor: Colors.grey,
    );
  }

  buildObservableBody(BuildContext context) {
    return Obx(() =>
        ctrl.isLoading.value ? buildCenterLoading() : buildLoginBody(context));
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

  buildLoginBody(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      child: SingleChildScrollView(
        padding: context.paddingNormal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getFormHeadImage(),
            getFormFields(context),
            getDescription()
          ],
        ),
      ),
    );
  }

  getFormHeadImage() {
    return Container(
      alignment: Alignment.center,
      width: Get.width * 0.9,
      height: Get.height * 0.3,
      child: Image.asset('assets/images/login.png'),
    );
  }

  getFormFields(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: context.paddingNormal,
              child: TextFormField(
                controller: ctrl.phoneController,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0.0),
                  labelText: 'phoneInput'.tr,
                  hintText: 'phoneHint'.tr,
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                  ),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 18,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade200, width: 2),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  floatingLabelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty ) {
                    return 'emptyInputMessage'.tr;
                  }
                  print(value);
                  // TODO ctrl.emailInput = value;
                  return null;
                },
              ),
            ),
            Padding(
              padding: context.paddingNormalHorizontal,
              child: TextFormField(
                controller: ctrl.passwordController,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0.0),
                  labelText: 'passwordInput'.tr,
                  hintText: 'passwordInput'.tr,
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                  ),
                  prefixIcon: Icon(
                    Icons.password,
                    color: Colors.black,
                    size: 18,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade200, width: 2),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  floatingLabelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                obscureText: true,
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'emptyInputMessage'.tr;
                  }
                  // TODO ctrl.passwordInput = value;
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: Colors.green,
                  padding: context.paddingLow,
                  minimumSize: Size(Get.width * 0.85, 50),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                ),
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    Get.snackbar('Giriş Yapılıyor', 'Lütfen bekleyiniz',
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 1),
                        snackPosition: SnackPosition.TOP);
                    ctrl.senLoginRequest();
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(content: Text('buttonProcess'.tr)),
                    // );

                  }
                },
                child: Obx(() => ctrl.isLoading.value
                    ? Icon(Icons.watch_later_outlined)
                    : Text('loginTitle'.tr)),
              ),
            ),
          ],
        ));
  }

  getDescription() {
    return Container();
  }
}
