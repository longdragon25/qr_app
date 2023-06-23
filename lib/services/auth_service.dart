// import 'package:get/get.dart';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:qr_app/constants/constants.dart';
import 'package:qr_app/models/data_response_model.dart';

class AuthService {
  Future<DataResponseModel> tryLogin(
      {required String userName, required String password}) async {
    try {
      var url = Uri.https(URL_API, '/api/app/qr-code/generate-ticket');
      var json = {
        "fullname": "Bui Doan Quang Huy",
        "citizenIdentification": "123123",
        "email": "huybuidoanquang@gmail.com",
        "phoneNumber": "012345678",
        "departureStation": "Ha Noi",
        "destinationStation": "Hai Phong",
        "departureTime": '{${DateTime.now().toString()}',
        "destinationTime": '${DateTime.now().add(Duration(days: 1)).toString()}'
      };

      Response response = await post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(json));
      int statusCode = response.statusCode;
      print('status code: $statusCode');
      print(response);
      // API này trả về id của item mới được add trong body
      String body = response.body;
      return DataResponseModel(message: success, data: body);
    } catch (e) {
      print('Exception login: ${e.toString()}');
      return DataResponseModel(message: fail);
    }
  }
}
