import 'package:gallop_web_flutter/common/http/request.dart';
import 'package:gallop_web_flutter/common/model/result.dart';
import 'package:gallop_web_flutter/common/model/user.dart';

class UserApi {
  static Future<Result> loginRequest(User loginForm) async {
    return await Request.requestReturn(Method.post, "/login", params: {
      "username": loginForm.userName,
      "password": loginForm.password
    });
  }

  static Future<Result> registerRequest(User loginForm) async {
    return await Request.requestReturn(Method.post, "/system/user/customerRegister", params: {
      "userName": loginForm.userName,
      "password": loginForm.password
    });
  }

  static Future<Result> getUserInfo(String username) async {
    return await Request.requestReturn(Method.post, "/system/user/customerUser",
        params: {"userName": username});
  }

  static Future<Result> updateUserInfo(
      int userId, String email, String phoneNumber, String sex) async {
    return await Request.requestReturn(
        Method.post, "/system/user/customerUpdateUser",
        params: {
          "userId": userId,
          "email": email,
          "phonenumber": phoneNumber,
          "sex": sex,
        });
  }

  static Future<Result> resetPass(
      int userId, String oldPassword, String newPassword) async {
    return await Request.requestReturn(
        Method.post, "/system/user/customerResetPass", params: {
      "userId": userId,
      "oldPassword": oldPassword,
      "newPassword": newPassword
    });
  }
}
