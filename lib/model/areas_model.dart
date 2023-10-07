class Areas {
  int? id;
  String? name;
  // int? areaCode;
  // String? createdAt;
  // String? updatedAt;
  // int? parentId;
  int? number;

  Areas(
      {this.id,
      this.name,
      // this.areaCode,
      // this.createdAt,
      // this.updatedAt,
      // this.parentId,
      this.number});

  Areas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    // areaCode = json['area_code'];
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
    // parentId = json['parent_id'];
    number = json['number'];
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
    return data;
  }
}
