import 'package:gallop_web_flutter/common/model/user.dart';

class UserAudit {
  int? userAuditId;
  int? userId;
  String? userIdCard;
  String? userAuditName;
  String? idCardImgs;
  String? rejectReason;
  String? status;
  User? user;

  UserAudit({
    this.userAuditId,
    this.userId,
    this.userIdCard,
    this.userAuditName,
    this.idCardImgs,
    this.rejectReason,
    this.status,
    this.user,
  });

  factory UserAudit.fromJson(Map<String, dynamic> json) {
    return UserAudit(
      userAuditId: json['userAuditId'],
      userId: json['userId'],
      userIdCard: json['userIdCard'],
      userAuditName: json['userAuditName'],
      idCardImgs: json['idCardImgs'],
      rejectReason: json['rejectReason'],
      status: json['status'],
      user: User.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() => {
        'userAuditId': userAuditId,
        'userId': userId,
        'userIdCard': userIdCard,
        'userAuditName': userAuditName,
        'idCardImgs': idCardImgs,
        'rejectReason': rejectReason,
        'status': status,
        'user': user?.toJson(),
      };
}