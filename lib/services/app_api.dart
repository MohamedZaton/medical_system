import '../models/booking_doctor_model.dart';
import '../models/delivery_model.dart';
import '../models/depart_item_model.dart';
import '../models/order_model.dart';

abstract class AppApi {
  /// list of main departments
  Future<List<DepartItemModel>> fetchDepartmentsItems();

  /// list of doctors each departments
  Future<List<BookingDoctorModel>> fetchDoctorBookingItems();

  /// list of sub-departments

  Future<List<DepartItemModel>> fetchSubDepartItems(
      {String fileName = "dep_clinics_data.json"});

  /// list of order log
  Future<List<OrderModel>> fetchOrdersItems();

  Future<List<DeliveryModel>> fetchDeliveriesItems();
}
