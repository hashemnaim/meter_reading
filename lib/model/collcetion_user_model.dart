class CollcetionUserModel {
  String? accountNo, price;
  String? dateTime, customerName;
  // UsersModel? usersModel;

  CollcetionUserModel({
    required this.accountNo,
    required this.price,
    required this.dateTime,
    required this.customerName,
    // required this.usersModel
  });

  CollcetionUserModel.fromJson(Map<String, dynamic> json) {
    accountNo = json["account_id"];
    dateTime = json["date_time"];
    price = json["price"];
    customerName = json["customer_name"];
    // usersModel = json["usersModel"];
  }

  Map<String, dynamic> toJson() => {
        "account_id": accountNo,
        "date_time": dateTime,
        "price": price,
        "customer_name": customerName,
        // "usersModel": usersModel,
      };
}
