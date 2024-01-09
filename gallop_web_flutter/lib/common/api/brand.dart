import 'package:gallop_web_flutter/common/http/request.dart';
import 'package:gallop_web_flutter/common/model/result.dart';

class BrandApi {
  static Future<Result> getAllBrands() async {
    return Request.requestReturn(Method.get, "/system/brand/listAll");
  }
}
