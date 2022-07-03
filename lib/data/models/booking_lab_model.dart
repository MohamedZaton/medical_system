class BookingLabModel {
  String? address;
  String? name;
  String? imagePath;
  String? dayStart;
  String? dayEnd;
  String? timeStart;
  String? timeEnd;
  String? analysesPrice;

  BookingLabModel(
      {this.address,
      this.name,
      this.dayStart,
      this.dayEnd,
      this.timeStart,
      this.timeEnd,
      this.analysesPrice,
      this.imagePath});

  BookingLabModel.fromJson(dynamic json) {
    address = json['address'];
    name = json['name'];
    imagePath = json['image_path'];
    dayStart = json['day_start'];
    dayEnd = json['day_end'];
    timeStart = json['time_start'];
    timeEnd = json['time_end'];
    analysesPrice = json['analyses_price'];
  }
  BookingLabModel copyWith({
    String? address,
    String? name,
    String? dayStart,
    String? dayEnd,
    String? timeStart,
    String? timeEnd,
    String? clinicPrice,
    String? homePrice,
    String? imagePath,
  }) =>
      BookingLabModel(
        address: address ?? this.address,
        name: name ?? this.name,
        dayStart: dayStart ?? this.dayStart,
        dayEnd: dayEnd ?? this.dayEnd,
        timeStart: timeStart ?? this.timeStart,
        timeEnd: timeEnd ?? this.timeEnd,
        analysesPrice: clinicPrice ?? this.analysesPrice,
        imagePath: imagePath ?? this.imagePath,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address'] = address;
    map['name'] = name;
    map['image_path'] = imagePath;
    map['day_start'] = dayStart;
    map['day_end'] = dayEnd;
    map['time_start'] = timeStart;
    map['time_end'] = timeEnd;
    map['analyses_price'] = analysesPrice;
    return map;
  }

  static List<BookingLabModel> getListObject(List<dynamic> jsonBody) {
    List<BookingLabModel> itemsList = List<BookingLabModel>.from(
        jsonBody.map((val) => BookingLabModel.fromJson(val)));
    return itemsList;
  }
}
