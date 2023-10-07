class EmployeeModel {
  int? id;
  String? name;
  String? mobile;
  String? photo;
  String? locationLong;
  String? locationLat;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? email;
  String? type;

  EmployeeModel(
      {this.id,
      this.name,
      this.mobile,
      this.photo,
      this.locationLong,
      this.locationLat,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt,
      this.email,
      this.type});

  EmployeeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    photo = json['photo'];
    locationLong = json['location_long'];
    locationLat = json['location_lat'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    email = json['email'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['mobile'] = mobile;
    data['photo'] = photo;
    data['location_long'] = locationLong;
    data['location_lat'] = locationLat;
    data['email_verified_at'] = emailVerifiedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['email'] = email;
    data['type'] = type;
    return data;
  }
}
