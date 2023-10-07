class FatoraModel {
  String? cost;
  String? dataTime;
  String? isCollection;

  FatoraModel({
    this.cost,
    this.dataTime,
    this.isCollection,
  });

  FatoraModel.fromJson(Map<String, dynamic> json) {
    cost = json["cost"];
    dataTime = json["dataTime"];
    isCollection = json["isCollection"];
  }

  Map<String, dynamic> toJson() => {
        "cost": cost,
        "dataTime": dataTime,
        "isCollection": isCollection,
      };
}
