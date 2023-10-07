class UsersModel {
  int? id;
  String? customerName;
  String? accountId;
  String? image;
  // String? block;
  // String? zone;
  // String? createdAt;
  // String? updatedAt;
  String? mobile;
  String? machineId;
  String? lastRead;
  // int? lastBill;
  // String? address;
  // String? amount;
  // String? notes;
  // String? status;
  // int? area;
  // int? subAreaCode;
  // String? subAreaName;
  // String? type;
  // int? tarefa;
  String? areaCode;

  UsersModel(
      {this.id,
      this.customerName,
      this.accountId,
      this.image,
      // this.block,
      // this.zone,
      // this.createdAt,
      // this.updatedAt,
      this.mobile,
      this.machineId,
      this.lastRead,
      // this.lastBill,
      // this.address,
      // this.amount,
      // this.notes,
      // this.status,
      // this.area,
      // this.subAreaCode,
      // this.subAreaName,
      // this.type,
      // this.tarefa,
      this.areaCode});

  UsersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerName = json['customer_name'];
    accountId = json['account_id'].toString();
    image = json['image_read'];
    // block = json['block'];
    // zone = json['zone'];
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
    mobile = json['mobile'];
    machineId = json['machine_id'].toString();
    lastRead = json['last_read'].toString();
    // lastBill = json['last_bill'];
    // address = json['address'];
    // amount = json['amount'];
    // notes = json['notes'];
    // status = json['status'];
    // area = json['area'];
    // subAreaCode = json['sub_area_code'];
    // subAreaName = json['sub_area_name'];
    // type = json['type'];
    // tarefa = json['tarefa'];
    areaCode = json['area_code'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['customer_name'] = customerName;
    data['account_id'] = accountId;
    data['image_read'] = image;
    // data['block'] = block;
    // data['zone'] = zone;
    // data['created_at'] = createdAt;
    // data['updated_at'] = updatedAt;
    data['mobile'] = mobile;
    data['machine_id'] = machineId;
    data['last_read'] = lastRead;
    // data['last_bill'] = lastBill;
    // data['address'] = address;
    // data['amount'] = amount;
    // data['notes'] = notes;
    // data['status'] = status;
    // data['area'] = area;
    // data['sub_area_code'] = subAreaCode;
    // data['sub_area_name'] = subAreaName;
    // data['type'] = type;
    // data['tarefa'] = tarefa;
    data['area_code'] = areaCode;
    return data;
  }
}
