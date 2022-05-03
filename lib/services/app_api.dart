import '../models/delivery_model.dart';
import '../models/depart_item_model.dart';
import '../models/order_model.dart';

abstract class AppApi {
  Future<List<DepartItemModel>> fetchDepartmentsItems();
  Future<List<DepartItemModel>> fetchSubDepartItems(
      {String fileName = "dep_clinics_data.json"});

  Future<List<OrderModel>> fetchOrdersItems();

  Future<List<DeliveryModel>> fetchDeliveriesItems();
}
