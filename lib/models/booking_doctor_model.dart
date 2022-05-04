class BookingDoctorModel {
  String? address;
  String? name;
  String? imagePath;
  String? dayStart;
  String? dayEnd;
  String? timeStart;
  String? timeEnd;
  String? clinicPrice;
  String? homePrice;
  BookingDoctorModel(
      {this.address,
      this.name,
      this.dayStart,
      this.dayEnd,
      this.timeStart,
      this.timeEnd,
      this.clinicPrice,
      this.homePrice,
      this.imagePath});

  BookingDoctorModel.fromJson(dynamic json) {
    address = json['address'];
    name = json['name'];
    imagePath = json['image_path'];
    dayStart = json['day_start'];
    dayEnd = json['day_end'];
    timeStart = json['time_start'];
    timeEnd = json['time_end'];
    clinicPrice = json['clinic_price'];
    homePrice = json['home_price'];
  }
  BookingDoctorModel copyWith({
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
      BookingDoctorModel(
        address: address ?? this.address,
        name: name ?? this.name,
        dayStart: dayStart ?? this.dayStart,
        dayEnd: dayEnd ?? this.dayEnd,
        timeStart: timeStart ?? this.timeStart,
        timeEnd: timeEnd ?? this.timeEnd,
        clinicPrice: clinicPrice ?? this.clinicPrice,
        homePrice: homePrice ?? this.homePrice,
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
    map['clinic_price'] = clinicPrice;
    map['home_price'] = homePrice;
    return map;
  }

  static List<BookingDoctorModel> getListObject(List<dynamic> jsonBody) {
    List<BookingDoctorModel> itemsList = List<BookingDoctorModel>.from(
        jsonBody.map((val) => BookingDoctorModel.fromJson(val)));
    return itemsList;
  }
}
