import 'package:get/get.dart';
import 'package:qr_app/models/data_response_model.dart';
import 'package:qr_app/services/auth_service.dart';

class LoginController extends GetxController {
  RxString imageQR = ''.obs;

  Future<String> loginByUserNamePassword(
      String userName, String password) async {
    DataResponseModel result =
        await AuthService().tryLogin(userName: userName, password: password);
    if (result.data != null && result.data!.isNotEmpty) {
      imageQR.value = result.data!;
      print(result.data!);
    }
    return result.message ?? "";
  }
}
