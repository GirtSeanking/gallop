import 'package:gallop_web_flutter/common/model/brand.dart';
import 'package:gallop_web_flutter/common/model/car.dart';
import 'package:gallop_web_flutter/common/model/car_type.dart';
import 'package:gallop_web_flutter/common/model/dept.dart';

class Order {
  String? createBy;
  String? createTime;
  String? updateBy;
  String? updateTime;
  String? remark;
  int? orderId;
  int? userId;
  int? carId;
  int? brandId;
  int? carTypeId;
  int? deptId;
  int? rentalDay;
  String? endTime;
  int? priceDay;
  int? priceTotal;
  String? payStatus;
  String? status;
  Car? carInfo;
  Dept? dept;
  CarType? carType;
  Brand? brand;

  Order(
      {this.createBy,
      this.createTime,
      this.updateBy,
      this.updateTime,
      this.remark,
      this.orderId,
      this.userId,
      this.carId,
      this.brandId,
      this.carTypeId,
      this.deptId,
      this.rentalDay,
      this.endTime,
      this.priceDay,
      this.priceTotal,
      this.payStatus,
      this.status,
      this.carInfo,
      this.dept,
      this.carType,
      this.brand});

  Order.fromJson(Map<String, dynamic> json) {
    createBy = json['createBy'];
    createTime = json['createTime'];
    updateBy = json['updateBy'];
    updateTime = json['updateTime'];
    remark = json['remark'];
    orderId = json['orderId'];
    userId = json['userId'];
    carId = json['carId'];
    brandId = json['brandId'];
    carTypeId = json['carTypeId'];
    deptId = json['deptId'];
    rentalDay = json['rentalDay'];
    endTime = json['endTime'];
    priceDay = json['priceDay'];
    priceTotal = json['priceTotal'];
    payStatus = json['payStatus'];
    status = json['status'];
    carInfo = json['carInfo'] != null ? Car.fromJson(json['carInfo']) : null;
    dept = json['dept'] != null ? Dept.fromJson(json['dept']) : null;
    carType =
        json['carType'] != null ? CarType.fromJson(json['carType']) : null;
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createBy'] = createBy;
    data['createTime'] = createTime;
    data['updateBy'] = updateBy;
    data['updateTime'] = updateTime;
    data['remark'] = remark;
    data['orderId'] = orderId;
    data['userId'] = userId;
    data['carId'] = carId;
    data['brandId'] = brandId;
    data['carTypeId'] = carTypeId;
    data['deptId'] = deptId;
    data['rentalDay'] = rentalDay;
    data['endTime'] = endTime;
    data['priceDay'] = priceDay;
    data['priceTotal'] = priceTotal;
    data['payStatus'] = payStatus;
    data['status'] = status;
    if (carInfo != null) {
      data['carInfo'] = carInfo!.toJson();
    }
    if (dept != null) {
      data['dept'] = dept!.toJson();
    }
    if (carType != null) {
      data['carType'] = carType!.toJson();
    }
    if (brand != null) {
      data['brand'] = brand!.toJson();
    }
    return data;
  }
}
