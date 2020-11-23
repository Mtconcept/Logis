import 'package:flutter/cupertino.dart';
import 'package:logi_app/networking/auth.dart';
import 'package:logi_app/utils/verification_mixin.dart';

class RegisterUserState extends ChangeNotifier with ValidationMixin {
  var emailController = TextEditingController();
  ApiState state = ApiState.Initials;
  Auth _auth = Auth();

  executeSendEmail() async {
    if (emailController.text != null) {
      state = ApiState.Loading;
      notifyListeners();
      try {
        var result = await _auth.sendEmailVerify(email: emailController.text);
        print(result.toJson());
        if (result.responseCode == 1) {
          state = ApiState.Success;
          notifyListeners();
        } else {
          state = ApiState.Error;
          notifyListeners();
        }
      } catch (e) {
        state = ApiState.Error;
        notifyListeners();
        throw Exception(e.toString());
      }
    }
  }
}

enum ApiState { Initials, Loading, Success, Error }
