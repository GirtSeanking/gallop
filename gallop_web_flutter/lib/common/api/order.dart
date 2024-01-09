import 'package:gallop_web_flutter/common/http/request.dart';
import 'package:gallop_web_flutter/common/model/result.dart';

class OrderApi {
  static Future<Result> addOrder(Map params) async {
    return await Request.requestReturn(
      Method.post,
      "/system/order/customerAddOrder",
      params: params,
    );
  }

  static Future<Result> getCustomerOrders(String username) async {
    return await Request.requestReturn(
      Method.post,
      "/system/order/customerOrders",
      params: {
        "username": username
      },
    );
  }

  static Future<Result> customerUpdateOrder(int orderId, String username, String status) async {
    return await Request.requestReturn(Method.post, "/system/order/customerUpdateOrder", params: {
      "orderId": orderId,
      "username": username,
      "status": status
    });
  }
}
