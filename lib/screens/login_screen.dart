import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_app/constants/constants.dart';
import 'package:qr_app/constants/validation_utils.dart';
import 'package:qr_app/controllers/login_controller.dart';
import 'package:qr_app/screens/information_screen.dart';
import 'package:qr_app/widgets/blue_button.dart';
import 'package:qr_app/widgets/custom_text_field.dart';
import 'package:qr_app/widgets/height_box.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Rxn<String> textError = Rxn<String>();
  Rx<bool> isLoading = false.obs;
  Rx<bool> isShowUrlInput = false.obs;

  final LoginController _loginController = Get.put(LoginController());

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                image: AssetImage('assets/images/background2.png'),
                fit: BoxFit.cover,
              )),
          child: Stack(
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Obx(() => isLoading.value
                    ? Padding(
                        padding: const EdgeInsets.only(
                            bottom: MDSize.StandardVerticalPadding * 2),
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : SizedBox()),
                CustomTextField(
                  // hintText: 'Enter your email address here',

                  hintText: 'Tên đăng nhập',
                  textController: emailController,
                  paddingVertical: 15,
                  isSentences: false,
                ),
                HeightBox(MDSize.StandardVerticalPadding),
                CustomTextField(
                  // hintText: 'Enter your password here',
                  hintText: 'Mật khẩu',
                  isPasswordField: true,
                  textController: passwordController,
                  paddingVertical: 15,
                  onFieldSubmitted: (text) {
                    _trySignIn();
                  },
                ),
                HeightBox(MDSize.StandardVerticalPadding * 2),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.3),
                  child: BlueButton(
                      // text: 'Login',
                      text: 'Đăng nhập',
                      action: () {
                        _trySignIn();
                      }),
                ),
              ]),
              Positioned(
                bottom: MDSize.StandardVerticalPadding * 2,
                // right: MDSize.StandardHorizontalPadding,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: MDSize.StandardHorizontalPadding),
                  child: Row(
                    children: [
                      Obx(
                        () => isShowUrlInput.value
                            ? CustomTextField(
                                hintText: 'Nhập URL',
                                widthSize: 70,
                                onChanged: (value) {
                                  URL_API = value.isEmpty
                                      ? "2f6e-222-252-26-209.ngrok-free.app"
                                      : value;
                                },
                              )
                            : SizedBox(
                                width: Get.width - 70,
                              ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                            onPressed: () {
                              isShowUrlInput.value = !isShowUrlInput.value;
                            },
                            icon: const Icon(Icons.link_rounded)),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _trySignIn() {
    textError.value = '';
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      _signInWithEmail();
    } else if (emailController.text.isEmpty &&
        passwordController.text.isNotEmpty) {
      textError.value = 'Please enter your user name';
    } else if (emailController.text.isNotEmpty &&
        passwordController.text.isEmpty) {
      textError.value = 'Please enter a password';
    } else {
      textError.value = 'Please enter your user name and password';
    }
  }

  Future<void> _signInWithEmail() async {
    print('Now: ${DateTime.now()}');
    print('Tomorow: ${DateTime.now().add(Duration(days: 1))}');
    isLoading.value = true;
    String result = await _loginController.loginByUserNamePassword(
        emailController.text, passwordController.text);
    isLoading.value = false;
    if (result == success) {
      Get.to(() => InformationScreen(), transition: Transition.cupertino);
    } else {}
  }
}
