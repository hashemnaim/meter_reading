class ProfileClinetModel {
  int? code;
  String? message;
  DataProfileClinet? data;

  ProfileClinetModel({this.code, this.message, this.data});

  ProfileClinetModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data =
        json['data'] != null ? DataProfileClinet.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataProfileClinet {
  int? id;
  String? customerName;
  String? customerId;
  int? accountId;
  String? block;
  String? zone;
  String? createdAt;
  String? updatedAt;
  String? mobile;
  String? machineId;
  int? lastRead;
  int? lastBill;
  String? address;
  String? amount;
  String? notes;
  String? status;
  int? area;
  int? subAreaCode;
  String? subAreaName;
  String? type;
  int? tarefa;
  int? areaCode;
  List<Reads>? reads;
  List<Reads>? bills;

  DataProfileClinet(
      {this.id,
      this.customerName,
      this.customerId,
      this.accountId,
      this.block,
      this.zone,
      this.createdAt,
      this.updatedAt,
      this.mobile,
      this.machineId,
      this.lastRead,
      this.lastBill,
      this.address,
      this.amount,
      this.notes,
      this.status,
      this.area,
      this.subAreaCode,
      this.subAreaName,
      this.type,
      this.tarefa,
      this.areaCode,
      this.reads,
      this.bills});

  DataProfileClinet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerName = json['customer_name'];
    customerId = json['customer_id'];
    accountId = json['account_id'];
    block = json['block'];
    zone = json['zone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    mobile = json['mobile'];
    machineId = json['machine_id'];
    lastRead = json['last_read'];
    lastBill = json['last_bill'];
    address = json['address'];
    amount = json['amount'];
    notes = json['notes'];
    status = json['status'];
    area = json['area'];
    subAreaCode = json['sub_area_code'];
    subAreaName = json['sub_area_name'];
    type = json['type'];
    tarefa = json['tarefa'];
    areaCode = json['area_code'];
    if (json['reads'] != null) {
      reads = <Reads>[];
      json['reads'].forEach((v) {
        reads!.add(Reads.fromJson(v));
      });
    }
    if (json['bills'] != null) {
      bills = <Reads>[];
      json['bills'].forEach((v) {
        bills!.add(Reads.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['customer_name'] = customerName;
    data['customer_id'] = customerId;
    data['account_id'] = accountId;
    data['block'] = block;
    data['zone'] = zone;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['mobile'] = mobile;
    data['machine_id'] = machineId;
    data['last_read'] = lastRead;
    data['last_bill'] = lastBill;
    data['address'] = address;
    data['amount'] = amount;
    data['notes'] = notes;
    data['status'] = status;
    data['area'] = area;
    data['sub_area_code'] = subAreaCode;
    data['sub_area_name'] = subAreaName;
    data['type'] = type;
    data['tarefa'] = tarefa;
    data['area_code'] = areaCode;
    if (reads != null) {
      data['reads'] = reads!.map((v) => v.toJson()).toList();
    }
    if (bills != null) {
      data['bills'] = bills!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reads {
  int? id;
  String? machineId;
  String? accountId;
  int? lastRead;
  int? currentRead;
  int? amount;
  int? status;
  int? userId;
  String? createdAt;
  String? updatedAt;
  String? imageUrl;
  int? important;
  String? year;
  String? month;
  int? area;
  String? subAreaCode;
  String? subAreaName;
  int? downloaded;
  String? locationLong;
  String? locationLat;
  int? paid;
  int? tarefa;
  String? averageAmount;
  int? archive;
  int? isEdited;

  Reads(
      {this.id,
      this.machineId,
      this.accountId,
      this.lastRead,
      this.currentRead,
      this.amount,
      this.status,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.imageUrl,
      this.important,
      this.year,
      this.month,
      this.area,
      this.subAreaCode,
      this.subAreaName,
      this.downloaded,
      this.locationLong,
      this.locationLat,
      this.paid,
      this.tarefa,
      this.averageAmount,
      this.archive,
      this.isEdited});

  Reads.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    machineId = json['machine_id'];
    accountId = json['account_id'];
    lastRead = json['last_read'];
    currentRead = json['current_read'];
    amount = json['amount'];
    status = json['status'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageUrl = json['image_url'];
    important = json['important'];
    year = json['year'];
    month = json['month'];
    area = json['area'];
    subAreaCode = json['sub_area_code'];
    subAreaName = json['sub_area_name'];
    downloaded = json['downloaded'];
    locationLong = json['location_long'];
    locationLat = json['location_lat'];
    paid = json['paid'];
    tarefa = json['tarefa'];
    averageAmount = json['average_amount'];
    archive = json['archive'];
    isEdited = json['is_edited'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['machine_id'] = machineId;
    data['account_id'] = accountId;
    data['last_read'] = lastRead;
    data['current_read'] = currentRead;
    data['amount'] = amount;
    data['status'] = status;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['image_url'] = imageUrl;
    data['important'] = important;
    data['year'] = year;
    data['month'] = month;
    data['area'] = area;
    data['sub_area_code'] = subAreaCode;
    data['sub_area_name'] = subAreaName;
    data['downloaded'] = downloaded;
    data['location_long'] = locationLong;
    data['location_lat'] = locationLat;
    data['paid'] = paid;
    data['tarefa'] = tarefa;
    data['average_amount'] = averageAmount;
    data['archive'] = archive;
    data['is_edited'] = isEdited;
    return data;
  }
}
