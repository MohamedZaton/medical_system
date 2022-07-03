class DeliveryModel {
  String? phone;
  String? name;

  DeliveryModel({this.phone, this.name});

  DeliveryModel.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['name'] = this.name;
    return data;
  }

  static List<DeliveryModel> getListObject(List<dynamic> jsonBody) {
    List<DeliveryModel> itemsList = List<DeliveryModel>.from(
        jsonBody.map((val) => DeliveryModel.fromJson(val)));
    return itemsList;
  }
}
