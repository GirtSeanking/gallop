import 'package:gallop_web_flutter/common/http/request.dart';
import 'package:gallop_web_flutter/common/model/result.dart';

class ActivityApi {
  static Future<Result> getActivityList() async {
    return Request.requestReturn(
        Method.get, "/system/activity/listForCustomer");
  }
}
