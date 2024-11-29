class LoginModel {
  int? success;
  String? msg;
  Data? data;

  LoginModel({this.success, this.msg, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? email;
  String? gender;
  String? dob;
  String? contact;
  String? joinDate;
  String? address;
  String? profile;
  String? deptId;
  String? roleId;
  String? orgId;
  String? resToken;
  String? resTokenExpiry;
  int? isPassChng;
  int? isSuperAdmin;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.name,
        this.email,
        this.gender,
        this.dob,
        this.contact,
        this.joinDate,
        this.address,
        this.profile,
        this.deptId,
        this.roleId,
        this.orgId,
        this.resToken,
        this.resTokenExpiry,
        this.isPassChng,
        this.isSuperAdmin,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    gender = json['gender'];
    dob = json['dob'];
    contact = json['contact'];
    joinDate = json['joinDate'];
    address = json['address'];
    profile = json['profile'];
    deptId = json['deptId'];
    roleId = json['roleId'];
    orgId = json['orgId'];
    resToken = json['resToken'];
    resTokenExpiry = json['resTokenExpiry'];
    isPassChng = json['isPassChng'];
    isSuperAdmin = json['isSuperAdmin'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['contact'] = this.contact;
    data['joinDate'] = this.joinDate;
    data['address'] = this.address;
    data['profile'] = this.profile;
    data['deptId'] = this.deptId;
    data['roleId'] = this.roleId;
    data['orgId'] = this.orgId;
    data['resToken'] = this.resToken;
    data['resTokenExpiry'] = this.resTokenExpiry;
    data['isPassChng'] = this.isPassChng;
    data['isSuperAdmin'] = this.isSuperAdmin;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}