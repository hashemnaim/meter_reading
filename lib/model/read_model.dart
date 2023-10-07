import 'package:meter_reading/model/areas_model.dart';
import 'package:meter_reading/model/user_model.dart';

class ReadsModel {
  int? code;
  bool? status;
  String? message;
  List<Areas>? areas;
  List<AreaUserList>? data;

  ReadsModel({this.code, this.status, this.message, this.areas, this.data});

  ReadsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['areas'] != null) {
      areas = <Areas>[];
      json['areas'].forEach((v) {
        areas!.add(Areas.fromJson(v));
      });
    }
    if (json['data'] != null) {
      data = <AreaUserList>[];
      json['data'].forEach((v) {
        data!.add(AreaUserList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['message'] = message;
    if (areas != null) {
      data['areas'] = areas!.map((v) => v.toJson()).toList();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AreaUserList {
  int? id;
  String? name;
  // int? areaCode;
  // String? createdAt;
  // String? updatedAt;
  // int? parentId;
  int? number;
  List<UsersModel>? accounts;

  AreaUserList(
      {this.id,
      this.name,
      // this.areaCode,
      // this.createdAt,
      // this.updatedAt,
      // this.parentId,
      this.number,
      this.accounts});

  AreaUserList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    // areaCode = json['area_code'];
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
    // parentId = json['parent_id'];
    number = json['number'];
    if (json['accounts'] != null) {
      accounts = <UsersModel>[];
      json['accounts'].forEach((v) {
        accounts!.add(UsersModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    // data['area_code'] = areaCode;
    // data['created_at'] = createdAt;
    // data['updated_at'] = updatedAt;
    // data['parent_id'] = parentId;
    data['number'] = number;
    if (accounts != null) {
      data['accounts'] = accounts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
