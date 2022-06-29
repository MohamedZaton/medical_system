import 'dart:convert';

class AnalysesModel {
  int? price;
  String? type;

  AnalysesModel({
    this.price,
    this.type,
  });

  AnalysesModel.fromJson(dynamic json) {
    price = json['Price'];
    type = json['Type'];
  }

  AnalysesModel copyWith({
    int? price,
    String? type,
  }) =>
      AnalysesModel(
        price: price ?? this.price,
        type: type ?? this.type,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Price'] = price;
    map['Type'] = type;
    return map;
  }

  static List<AnalysesModel> getListObject(List<dynamic> jsonBody) {
    List<AnalysesModel> itemsList = List<AnalysesModel>.from(
        jsonBody.map((val) => AnalysesModel.fromJson(val)));
    return itemsList;
  }
}

AnalysesModel analysesModelFromJson(String str) =>
    AnalysesModel.fromJson(json.decode(str));
String analysesModelToJson(AnalysesModel data) => json.encode(data.toJson());
