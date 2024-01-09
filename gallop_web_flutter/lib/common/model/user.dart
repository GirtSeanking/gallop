import 'package:gallop_web_flutter/common/utils/object_util.dart';

class User {
  int? userId;
  String? userName;
  String? nickName;
  String? email;
  String? phoneNumber;
  String? sex;
  String? password;
  String? token;

  User({
    this.userId,
    this.userName,
    this.nickName,
    this.email,
    this.phoneNumber,
    this.sex,
    this.password,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'],
      userName: json['userName'],
      nickName: json['nickName'],
      email: json['email'],
      phoneNumber: json['phonenumber'],
      sex: json['sex'],
      password: json['password'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'userName': userName,
        'nickName': nickName,
        'email': email,
        'phonenumber': phoneNumber,
        'sex': sex,
        'password': password,
        'token': token,
      };

  bool isNotEmpty() {
    return ObjectUtil.isNotEmpty(userName) &&
        ObjectUtil.isNotEmpty(password) &&
        ObjectUtil.isNotEmpty(token);
  }
}
