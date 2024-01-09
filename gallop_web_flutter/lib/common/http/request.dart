import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:gallop_web_flutter/common/model/result.dart';

/// 连接超时时间
const int _connectTimeout = 10000;

/// 接收超时时间
const int _receiveTimeout = 10000;

/// 发送超时时间
const int _sendTimeout = 10000;

const String url = "http://127.0.0.1:8080";

enum Method {
  get(name: "get"),
  post(name: "post"),
  delete(name: "delete"),
  put(name: "put"),
  patch(name: "patch"),
  head(name: "head");

  const Method({required this.name});

  final String name;
}

class Request {
  static Dio? _dio;

  static Dio createInstance([bool isJson = true]) {
    if (_dio == null) {
      var baseUrl = url;

      /// 全局属性：请求前缀、连接超时时间、响应超时时间
      var options = BaseOptions(
        ///提交方式：1.表单提交 2.JSON方式提交
        /// 请求的Content-Type，默认值是"application/json; charset=utf-8".
        /// 如果您想以"application/x-www-form-urlencoded"格式编码请求数据,
        /// 可以设置此选项为 `Headers.formUrlEncodedContentType`,  这样[Dio]就会自动编码请求体.
        contentType: isJson
            ? Headers.jsonContentType
            : Headers.formUrlEncodedContentType,
        // 适用于post form表单提交
        // responseType: ResponseType.json,
        validateStatus: (status) {
          /// 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
          return true;
        },
        baseUrl: baseUrl,
        connectTimeout: const Duration(milliseconds: _connectTimeout),
        receiveTimeout: const Duration(milliseconds: _receiveTimeout),
      );
      _dio = Dio(options);
    }
    _dio?.options.contentType =
        isJson ? Headers.jsonContentType : Headers.formUrlEncodedContentType;
    // baseUrl 需要读写文件获取，并且修改频率低，这里就不修正了，提供一个updateBaseUrl方法。
    return _dio!;
  }

  static String baseUrl() {
    var dio = _dio ?? createInstance();
    return dio.options.baseUrl;
  }

  static Future<Result> requestReturn(Method method, String path,
      {dynamic params, bool isJson = true}) async {
    print("request url ==============> ${Request.baseUrl()}$path");
    try {
      ///请求前先检查网络连接
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        return Result(1, "网络连接失败，请检查网络连接");
      }
      Dio dio = createInstance(isJson);
      Response response = await dio.request(path,
          data: params,
          options: Options(method: method.name, headers: _headerToken()));
      if (response.data is String) {
        return Result.fromJson(jsonDecode(response.data));
      } else {
        return Result.fromJson(response.data);
      }
    } on DioError catch (e) {
      return Result(1, e.message ?? "接口失败");
    } catch (e) {
      return Result(1, "接口失败");
    }
  }
}

/// 请求时添加cookie
Map<String, dynamic>? _headerToken() {
  //  获取当前登录用户
  // if (user.token == null) {
  //   return {'jnpf-origin': 'app'};
  // }
  // Map<String, dynamic> httpHeaders = {
  //   //'name' : Uri.encodeComponent(user.name),
  //   'Authorization': user.token,
  //   'jnpf-origin': 'app',
  // };
  return {};
}
