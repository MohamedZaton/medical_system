import 'dart:io';

import 'package:developer/data/models/analyses_model.dart';
import 'package:developer/data/models/booking_doctor_model.dart';
import 'package:developer/data/models/delivery_model.dart';
import 'package:developer/data/models/depart_item_model.dart';
import 'package:developer/data/models/log_in_model.dart';
import 'package:developer/data/models/register_model.dart';
import 'package:developer/data/models/upload_model.dart';
import 'package:developer/data/services/app_api.dart';
import 'package:dio/dio.dart';

import '../../tools/api_keys.dart';
import '../models/order_model.dart';
import 'local_data.dart';

class ServerAppApi implements AppApi {
  final String baseServer = 'http://wecarematrooh.com/api/';
  var dio = Dio();

  @override
  Future<Response> postRegisterRequest(RegisterModel registerModel) async {
    String registerUrl = baseServer + 'client/register';
    final RegisterResponse =
        await dio.post(registerUrl, data: registerModel.toJson());
    return RegisterResponse;
  }

  @override
  Future<Response> postLoginRequest(LogInModel logInModel) async {
    String loginUrl = baseServer + 'client/login';
    final loginResponse = await dio.post(loginUrl, data: logInModel.toJson());
    return loginResponse;
  }

  @override
  Future<Response> postUploadFlowRequest(UploadModel uploadModel, File file,
      {bool hasImage = true}) async {
    String token = await LocalData().readAccessToken();

    dio.options.headers["locale"] = "ar";
    dio.options.headers["Authorization"] = "Bearer ${token}";
    dio.options.headers["Accept"] = 'application/json';

    String fileName = file.path.split('/').last;

    String UploadUrl = baseServer + 'client/createReservation';

    var formData = FormData.fromMap({
      'reservation_date': uploadModel.reservationDate,
      'reservation_time': uploadModel.reservationTime,
      'service_provider_id': uploadModel.serviceProviderId,
      'service_id': uploadModel.serviceId,
      'zone_id': uploadModel.zoneId,
    });

    if (hasImage) {
      formData = FormData.fromMap({
        'reservation_date': uploadModel.reservationDate,
        'reservation_time': uploadModel.reservationTime,
        'service_provider_id': uploadModel.serviceProviderId,
        // 'service_id': uploadModel.serviceId,
        'zone_id': uploadModel.zoneId,
        'image': await MultipartFile.fromFile(file.path, filename: fileName),
      });
    }

    final UploadResponse = await dio.post(UploadUrl, data: formData);
    return UploadResponse;
  }

/*  Future addImage(
      reservationDate, reservationTime, serviceId, zoneId, File file) async {
    String fileName = file.path.split('/').last;
    var formData = FormData.fromMap({
      'reservation_date': reservationDate,
      'reservation_time': reservationTime,
      'service_id': serviceId,
      'zone_id': zoneId,
      'image': await MultipartFile.fromFile(file.path, filename: fileName),
    });
    await dio.post("${host}/add", data: formData).then((data) {
      ad_data = data.data;
    });
    return ad_data;
  }*/

  @override
  Future<Response> getLogOutRequest() async {
    String logOutUrl = baseServer + 'client/logout';

    String token = await LocalData().readAccessToken();
    dio.options.headers["Authorization"] = "Bearer ${token}";
    dio.options.headers["Accept"] = 'application/json';

    Response logOutResponse = await dio.get(logOutUrl);
    String message = logOutResponse.data["message"];
    print("[LogOut] message : $message");
    return logOutResponse;
  }

  @override
  Future<Response> getProfileInfoRequest() async {
    String profileInfoUrl = baseServer + 'client/getProfile';
    String token = await LocalData().readAccessToken();
    dio.options.headers["Authorization"] = "Bearer ${token}";
    dio.options.headers["Accept"] = 'application/json';
    Response profileResponse = await dio.get(profileInfoUrl);
    return profileResponse;
  }

  @override
  Future<Response> getAdsRequest() async {
    String adsUrl = baseServer + 'client/adsList';
    String token = await LocalData().readAccessToken();
    dio.options.headers["Authorization"] = "Bearer ${token}";
    dio.options.headers["Accept"] = 'application/json';
    Response adsResponse = await dio.get(adsUrl);

    return adsResponse;
  }

  @override
  Future<Response> getReservationRequest() async {
    String ReservUrl = baseServer + 'client/myReservations';
    String token = await LocalData().readAccessToken();
    dio.options.headers["Authorization"] = "Bearer ${token}";
    dio.options.headers["Accept"] = 'application/json';
    Response reservResponse = await dio.get(ReservUrl);

    return reservResponse;
  }

  @override
  Future<Response> getZonesListRequest() async {
    String zonesUrl = baseServer + 'client/zonesList';
    String token = await LocalData().readAccessToken();
    dio.options.headers["Authorization"] = "Bearer ${token}";
    dio.options.headers["Accept"] = 'application/json';
    Response zonesResponse = await dio.get(zonesUrl);
    return zonesResponse;
  }

  @override
  Future<Response> putReservationRequest(int id) async {
    String ReservDeleteUrl = baseServer + 'client/cancelReservation/$id';
    String token = await LocalData().readAccessToken();
    dio.options.headers["Authorization"] = "Bearer ${token}";
    dio.options.headers["Accept"] = 'application/json';
    Response reservResponse = await dio.put(ReservDeleteUrl);
    return reservResponse;
  }

  @override
  Future<Response> getDeleverRequest() async {
    String deliverUrl = baseServer + 'client/deliveriesList';
    String token = await LocalData().readAccessToken();
    dio.options.headers["Authorization"] = "Bearer ${token}";
    dio.options.headers["Accept"] = 'application/json';
    Response deliverResponse = await dio.get(deliverUrl);
    return deliverResponse;
  }

  @override
  Future<Response> getParentDepartmentRequest() async {
    String parentCtgUrl = baseServer + 'client/parentCategoriesList';
    String token = await LocalData().readAccessToken();
    dio.options.headers["Authorization"] = "Bearer ${token}";
    dio.options.headers["Accept"] = 'application/json';
    Response parentResponse = await dio.get(parentCtgUrl);
    return parentResponse;
  }

  @override
  Future<Response> getSubDepartmentRequest(int id) async {
    String parentCtgUrl = baseServer + 'client/subCategoriesList/$id';
    String token = await LocalData().readAccessToken();
    dio.options.headers["Authorization"] = "Bearer ${token}";
    dio.options.headers["Accept"] = 'application/json';
    Response childResponse = await dio.get(parentCtgUrl);
    return childResponse;
  }

  @override
  Future<Response> getServiceDetailsRequest(int id) async {
    String serviceDetailsUrl = baseServer + 'client/serviceDetails/$id';
    String token = await LocalData().readAccessToken();
    dio.options.headers["Authorization"] = "Bearer ${token}";
    dio.options.headers["Accept"] = 'application/json';
    Response serviceDetailResponse = await dio.get(serviceDetailsUrl);
    return serviceDetailResponse;
  }

  @override
  Future<Response> getServicesListRequest(int id) async {
    String serviceListsUrl = baseServer + 'client/getServicesList/$id';
    String token = await LocalData().readAccessToken();
    dio.options.headers["Authorization"] = "Bearer ${token}";
    dio.options.headers["Accept"] = 'application/json';
    Response serviceListResponse = await dio.get(serviceListsUrl);
    return serviceListResponse;
  }

  @override
  Future<Response> getFacebookPageRequest() async {
    String facebookUrl = baseServer + 'client/getFacebookUrl';
    String token = await LocalData().readAccessToken();
    dio.options.headers["Authorization"] = "Bearer ${token}";
    dio.options.headers["Accept"] = 'application/json';
    Response faceBookResponse = await dio.get(facebookUrl);
    print("facebook page : ${faceBookResponse.toString()}");
    return faceBookResponse;
  }

  @override
  Future<Response> getWhatsAppNumbersRequest() async {
    String facebookUrl = baseServer + 'client/getWhatsAppContact';
    String token = await LocalData().readAccessToken();
    dio.options.headers["Authorization"] = "Bearer ${token}";
    dio.options.headers["Accept"] = 'application/json';
    Response whatsapResponse = await dio.get(facebookUrl);
    print("whatsapp numbers  : ${whatsapResponse.data.toString()}");
    return whatsapResponse;
  }

  @override
  Future<Response> getAboutsRequest() async {
    String facebookUrl = baseServer + 'client/getAbout';
    String token = await LocalData().readAccessToken();
    dio.options.headers["Authorization"] = "Bearer ${token}";
    dio.options.headers["Accept"] = 'application/json';
    Response response = await dio.get(facebookUrl);
    print("about request : ${response.data.toString()}");
    return response;
  }

  @override
  Future<List<DepartItemModel>> fetchDepartmentsItems() async {
    throw UnimplementedError();
  }

  @override
  Future<List<OrderModel>> fetchOrdersItems() async {
    throw UnimplementedError();
  }

  @override
  Future<List<AnalysesModel>> fetchAnalysesItems() async {
    throw UnimplementedError();
  }

  @override
  Future<List<DeliveryModel>> fetchDeliveriesItems() async {
    throw UnimplementedError();
  }

  @override
  Future<List<DepartItemModel>> fetchSubDepartItems(
      {String fileName = kClinicsPath}) async {
    throw UnimplementedError();
  }

  @override
  Future<List<BookingDoctorModel>> fetchDoctorBookingItems() async {
    throw UnimplementedError();
  }
}
