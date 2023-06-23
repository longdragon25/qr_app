import 'package:get/get.dart';

class MDSize {
  MDSize._();

  static const StandardHorizontalPadding = 16.0;
  static const StandardVerticalPadding = 16.0;
  static const BucketWidth = 100.0;
  static const PersonalImageRatio = 2.5;
  static const SubTabHeight = 40.0;

  static double getWidthBucket() {
    var widthSize = Get.width / 2 -
        MDSize.StandardHorizontalPadding * 2 -
        (Get.width * 2) / 16;

    return widthSize;
  }
}

String URL_API = "2f6e-222-252-26-209.ngrok-free.app";
const String URL_QR_IMAGE =
    "https://1e44-222-252-26-209.ngrok-free.app/blob/cXJjb2RlLWltYWdlLWNvbnRhaW5lcg==/d1b43c0d-d61d-ec7c-60e7-3a0bf688b61c";
const String success = "Success";
const String fail = "fail";
