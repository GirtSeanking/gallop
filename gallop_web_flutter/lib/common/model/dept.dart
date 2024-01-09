class Dept {
  String? createBy;
  String? createTime;
  String? updateBy;
  String? updateTime;
  String? remark;
  int? deptId;
  String? parentId;
  String? ancestors;
  String? deptName;
  String? orderNum;
  String? leader;
  String? phone;
  String? email;
  String? status;
  String? delFlag;
  String? parentName;
  List<Dept>? children;

  Dept(
      {this.createBy,
      this.createTime,
      this.updateBy,
      this.updateTime,
      this.remark,
      this.deptId,
      this.parentId,
      this.ancestors,
      this.deptName,
      this.orderNum,
      this.leader,
      this.phone,
      this.email,
      this.status,
      this.delFlag,
      this.parentName,
      this.children});

  Dept.fromJson(Map<String, dynamic> json) {
    createBy = json['createBy'];
    createTime = json['createTime'];
    updateBy = json['updateBy'];
    updateTime = json['updateTime'];
    remark = json['remark'];
    deptId = json['deptId'];
    parentId = json['parentId'];
    ancestors = json['ancestors'];
    deptName = json['deptName'];
    orderNum = json['orderNum'];
    leader = json['leader'];
    phone = json['phone'];
    email = json['email'];
    status = json['status'];
    delFlag = json['delFlag'];
    parentName = json['parentName'];
    if (json['children'] != null) {
      children = <Dept>[];
      json['children'].forEach((v) {
        children!.add(Dept.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createBy'] = createBy;
    data['createTime'] = createTime;
    data['updateBy'] = updateBy;
    data['updateTime'] = updateTime;
    data['remark'] = remark;
    data['deptId'] = deptId;
    data['parentId'] = parentId;
    data['ancestors'] = ancestors;
    data['deptName'] = deptName;
    data['orderNum'] = orderNum;
    data['leader'] = leader;
    data['phone'] = phone;
    data['email'] = email;
    data['status'] = status;
    data['delFlag'] = delFlag;
    data['parentName'] = parentName;
    if (children != null) {
      data['children'] = children!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
