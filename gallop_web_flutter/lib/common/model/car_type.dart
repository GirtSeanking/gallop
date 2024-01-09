class CarType {
  String? createBy;
  String? createTime;
  String? updateBy;
  String? updateTime;
  String? remark;
  int? carTypeId;
  String? carTypeName;
  String? status;

  CarType(
      {this.createBy,
      this.createTime,
      this.updateBy,
      this.updateTime,
      this.remark,
      this.carTypeId,
      this.carTypeName,
      this.status});

  CarType.fromJson(Map<String, dynamic> json) {
    createBy = json['createBy'];
    createTime = json['createTime'];
    updateBy = json['updateBy'];
    updateTime = json['updateTime'];
    remark = json['remark'];
    carTypeId = json['carTypeId'];
    carTypeName = json['carTypeName'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createBy'] = createBy;
    data['createTime'] = createTime;
    data['updateBy'] = updateBy;
    data['updateTime'] = updateTime;
    data['remark'] = remark;
    data['carTypeId'] = carTypeId;
    data['carTypeName'] = carTypeName;
    data['status'] = status;
    return data;
  }
}
