class Brand {
  String? createBy;
  String? createTime;
  String? updateBy;
  String? updateTime;
  String? remark;
  int? brandId;
  String? brandName;
  String? brandDes;
  String? status;

  Brand(
      {this.createBy,
      this.createTime,
      this.updateBy,
      this.updateTime,
      this.remark,
      this.brandId,
      this.brandName,
      this.brandDes,
      this.status});

  Brand.fromJson(Map<String, dynamic> json) {
    createBy = json['createBy'];
    createTime = json['createTime'];
    updateBy = json['updateBy'];
    updateTime = json['updateTime'];
    remark = json['remark'];
    brandId = json['brandId'];
    brandName = json['brandName'];
    brandDes = json['brandDes'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createBy'] = createBy;
    data['createTime'] = createTime;
    data['updateBy'] = updateBy;
    data['updateTime'] = updateTime;
    data['remark'] = remark;
    data['brandId'] = brandId;
    data['brandName'] = brandName;
    data['brandDes'] = brandDes;
    data['status'] = status;
    return data;
  }
}
