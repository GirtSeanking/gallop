import 'dart:convert';

import 'package:gallop_web_flutter/common/model/user.dart';
import 'package:gallop_web_flutter/common/services/storage_service.dart';
import 'package:gallop_web_flutter/common/utils/object_util.dart';

class UserService {
  final String userKey = "USER";

  void saveUserInfo(User user) {
    StorageService().put(userKey, jsonEncode(user));
  }

  String? getToken() {
    String? userStr = StorageService().get(userKey);
    if (ObjectUtil.isNotBlank(userStr)) {
      User user = User.fromJson(jsonDecode(userStr!));
      return user.token;

    }
    return null;
  }

  String? getUserUsername() {
    String? userStr = StorageService().get(userKey);
    if (ObjectUtil.isNotBlank(userStr)) {
      User user = User.fromJson(jsonDecode(userStr!));
      return user.userName;
    }
    return null;
  }

  Future<bool> deleteUserInfo() async {
    return await StorageService().remove(userKey);
  }
}