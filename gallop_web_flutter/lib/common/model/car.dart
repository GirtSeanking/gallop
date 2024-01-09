import 'package:gallop_web_flutter/common/model/brand.dart';
import 'package:gallop_web_flutter/common/model/car_type.dart';
import 'package:gallop_web_flutter/common/model/dept.dart';

class Car {
  String? createBy;
  String? createTime;
  String? updateBy;
  String? updateTime;
  String? remark;
  int? carId;
  int? brandId;
  int? carTypeId;
  int? deptId;
  String? carName;
  String? carDes;
  String? carImgs;
  String? status;
  double? rent;
  Dept? dept;
  Brand? brand;
  CarType? carType;

  Car(
      {this.createBy,
      this.createTime,
      this.updateBy,
      this.updateTime,
      this.remark,
      this.carId,
      this.brandId,
      this.carTypeId,
      this.deptId,
      this.carName,
      this.carDes,
      this.carImgs,
      this.status,
      this.rent,
      this.dept,
      this.brand,
      this.carType});

  Car.fromJson(Map<String, dynamic> json) {
    createBy = json['createBy'];
    createTime = json['createTime'];
    updateBy = json['updateBy'];
    updateTime = json['updateTime'];
    remark = json['remark'];
    carId = json['carId'];
    brandId = json['brandId'];
    carTypeId = json['carTypeId'];
    deptId = json['deptId'];
    carName = json['carName'];
    carDes = json['carDes'];
    carImgs = json['carImgs'];
    status = json['status'];
    rent = json['rent'];
    dept = json['dept'] != null ? new Dept.fromJson(json['dept']) : null;
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    carType =
        json['carType'] != null ? new CarType.fromJson(json['carType']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createBy'] = this.createBy;
    data['createTime'] = this.createTime;
    data['updateBy'] = this.updateBy;
    data['updateTime'] = this.updateTime;
    data['remark'] = this.remark;
    data['carId'] = this.carId;
    data['brandId'] = this.brandId;
    data['carTypeId'] = this.carTypeId;
    data['deptId'] = this.deptId;
    data['carName'] = this.carName;
    data['carDes'] = this.carDes;
    data['carImgs'] = this.carImgs;
    data['status'] = this.status;
    data['rent'] = this.rent;
    if (this.dept != null) {
      data['dept'] = this.dept!.toJson();
    }
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    if (this.carType != null) {
      data['carType'] = this.carType!.toJson();
    }
    return data;
  }
}
