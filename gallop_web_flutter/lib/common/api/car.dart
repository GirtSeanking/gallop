import 'package:gallop_web_flutter/common/http/request.dart';
import 'package:gallop_web_flutter/common/model/result.dart';

class CarApi {

  static Future<Result> getAllCarList(Map param) async {
    return Request.requestReturn(Method.post, "/system/carInfo/listForCustomer",
        params: param);
  }

  static Future<Result> getAllCarListLimit(Map param, int limit) async {
    return Request.requestReturn(Method.post, "/system/carInfo/listForCustomer?pageNum=1&pageSize=$limit",
        params: param);
  }
}
