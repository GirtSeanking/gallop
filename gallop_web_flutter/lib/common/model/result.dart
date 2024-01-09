class Result<T> {
  T? data;
  int? total;
  String? msg;
  int? code;
  String? token;
  List<T>? rows;

  Result(int code, String msg) {
    code = code;
    msg = msg;
  }

  Result.fromJson(dynamic json) {
    code = json['code'];
    msg = json['msg'];
    total = json['total'];
    data = json['data'];
    rows = json['rows'];
    token = json['token'];
  }
}
