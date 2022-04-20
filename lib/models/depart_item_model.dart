class DepartItemModel {
  String? department;
  String? iconPath;
  String? goPath;

  DepartItemModel({this.department, this.iconPath, this.goPath});

  DepartItemModel.fromJson(Map<String, dynamic> json) {
    department = json['department'];
    iconPath = json['icon_path'];
    goPath = json['go_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['department'] = this.department;
    data['icon_path'] = this.iconPath;
    data['go_path'] = this.goPath;
    return data;
  }

  static List<DepartItemModel> getListObject(List<dynamic> jsonBody) {
    List<DepartItemModel> itemsList = List<DepartItemModel>.from(
        jsonBody.map((val) => DepartItemModel.fromJson(val)));
    return itemsList;
  }
}
