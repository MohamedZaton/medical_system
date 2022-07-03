import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../tools/constants.dart';

class MedicalFormLogic extends GetxController {
  File image = new File('');
  String? imagePath;
  bool isAttached = false;
  final ImagePicker _picker = ImagePicker();
  String selectedAddressPharmices = kSelectedAddressTxt;
  void choseAddressPharmices(String address) {
    selectedAddressPharmices = address;
    update();
  }

  Future<void> getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      imagePath = pickedFile.path;
      print(imagePath);
      isAttached = true;
      update();
    } else {
      print('No image selected.');
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
