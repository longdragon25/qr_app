import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_app/screens/qr_screen.dart';
import 'package:qr_app/widgets/blue_button.dart';
import 'package:qr_app/widgets/custom_text_field.dart';

import '../constants/constants.dart';
import '../widgets/height_box.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({Key? key}) : super(key: key);

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  TextEditingController fullname = TextEditingController();
  TextEditingController citizenIdentification = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController departureStation = TextEditingController();
  TextEditingController destinationStation = TextEditingController();
  TextEditingController departureTime = TextEditingController();
  TextEditingController destinationTime = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    fullname.dispose();
    citizenIdentification.dispose();
    emailController.dispose();
    phoneNumber.dispose();
    departureStation.dispose();
    destinationStation.dispose();
    departureTime.dispose();
    destinationTime.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Xác nhận giao dịch')),
      body: SafeArea(
          child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Container(
          height: Get.height,
          width: Get.width,
          color: Colors.transparent,
          child: SingleChildScrollView(
            child: Column(
              children: [
                HeightBox(MDSize.StandardVerticalPadding * 2.5),
                CustomTextField(
                  // hintText: 'Enter your email address here',
                  hintText: 'Tên đầy đủ',
                  textController: fullname,
                  paddingVertical: 15,
                  isSentences: false,
                ),
                HeightBox(MDSize.StandardVerticalPadding),
                CustomTextField(
                  // hintText: 'Enter your password here',
                  hintText: 'Căn cước công dân',

                  textController: citizenIdentification,
                  paddingVertical: 15,
                ),
                HeightBox(MDSize.StandardVerticalPadding),
                CustomTextField(
                  // hintText: 'Enter your email address here',
                  hintText: 'Email',
                  textController: emailController,
                  paddingVertical: 15,
                  isSentences: false,
                ),
                HeightBox(MDSize.StandardVerticalPadding),
                CustomTextField(
                  // hintText: 'Enter your password here',
                  hintText: 'Số điện thoại',

                  textController: phoneNumber,
                  paddingVertical: 15,
                ),
                HeightBox(MDSize.StandardVerticalPadding),
                CustomTextField(
                  // hintText: 'Enter your email address here',
                  hintText: 'Trạm khởi hành',
                  textController: departureStation,
                  paddingVertical: 15,
                  isSentences: false,
                ),
                HeightBox(MDSize.StandardVerticalPadding),
                CustomTextField(
                  // hintText: 'Enter your password here',
                  hintText: 'Trạm đích',

                  textController: destinationStation,
                  paddingVertical: 15,
                ),
                HeightBox(MDSize.StandardVerticalPadding),
                CustomTextField(
                  // hintText: 'Enter your email address here',
                  hintText: 'Giờ khởi hành',
                  textController: departureTime,
                  paddingVertical: 15,
                  isSentences: false,
                ),
                HeightBox(MDSize.StandardVerticalPadding),
                CustomTextField(
                  // hintText: 'Enter your password here',
                  hintText: 'Thời gian đích',

                  textController: destinationTime,
                  paddingVertical: 15,
                ),
                HeightBox(MDSize.StandardVerticalPadding * 2),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.3),
                  child: BlueButton(
                      // text: 'Login',
                      text: 'Xác Nhận',
                      action: () {
                        Get.to(() => QrScreen(),
                            transition: Transition.cupertino);
                      }),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
