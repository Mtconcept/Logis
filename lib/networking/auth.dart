import 'dart:convert';
import 'package:logi_app/models/api_response.dart';
import 'package:logi_app/models/send_email_verification.dart';
import 'package:logi_app/networking/api_constants.dart';
import 'package:logi_app/networking/api_manager.dart';
import 'package:http/http.dart' as http;

class Auth {
  ApiManager _apiManager = ApiManager();

  @deprecated
  Future<SendEmailModel> sendEmail({String email}) async {
    final http.Response response = await http.post(
      ApiConstant.sendverificationEndPoint,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'emailAddress': email,
      }),
    );
    if (response.statusCode == 200) {
      print(response.body);
      return SendEmailModel.fromJson(jsonDecode(response.body));
    } else {
      print("Exception Occurred");
      throw Exception("Error Occurred");
    }
  }

  Future<ResponseVerifyEmail> sendEmailVerify({String email}) async {
    var bodyData = SendEmailModel(emailAddress: email);
    var response = await _apiManager.postData(
        body: bodyData.toJson(),
        endPoint:
            "EndPointHere");
    print("made the call");
    print(bodyData.toJson());
    print(response.body);
    return ResponseVerifyEmail.fromJson(jsonDecode(response.body));
  }
}
