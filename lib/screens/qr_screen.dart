import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_app/constants/constants.dart';
import 'package:qr_app/controllers/login_controller.dart';

class QrScreen extends StatelessWidget {
  QrScreen({Key? key}) : super(key: key);

  final LoginController _loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Thông tin vé')),
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          child: Image.network(URL_QR_IMAGE),
        ),
      ),
    );
  }
}
