import 'dart:io';

import 'package:developer/core/utils/images_path.dart';
import 'package:developer/data/models/upload_model.dart';
import 'package:developer/presentation/pages/home/home_view.dart';
import 'package:developer/presentation/pages/message/message_view.dart';
import 'package:developer/tools/colors.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/repositories/user_repository_impl.dart';
import '../../../tools/constants.dart';

class MedicalFormLogic extends GetxController {
  File image = new File('');
  String? imagePath;
  bool isAttached = false;
  final ImagePicker _picker = ImagePicker();
  bool isUploaded = false;
  UploadModel? uploadModel;
  String selectedAddressPharmices = kSelectedAddressTxt;
  void choseAddressPharmices(String address) {
    selectedAddressPharmices = address;
    update();
  }

  void setUploadModel(UploadModel uploadModelV) {
    uploadModel = uploadModelV;
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

  Future<void> sendMedicalPaper() async {
    print("start uploading image ");
    final response =
        await UserRepositoryImpl().createMedicalPaper(uploadModel!, image);
    response.fold((failure) {
      Get.snackbar("Failed Upload", failure.message,
          backgroundColor: kDarkAccent);
      print("Failed Upload ${failure.message}");
      Get.to(MessagePage(
        imagePath: kFailedImg,
        message: kUploadFaildTxt,
        nameButton: kBackTxt,
        onPressed: () {
          Get.off(HomePage());
        },
      ));

      return;
    }, (isSuccess) {
      isUploaded = isSuccess;
      Get.snackbar("state upload", "$isUploaded");
      print("state upload $isUploaded");

      update();
      Get.to(MessagePage(
        imagePath: kSuccessImg,
        message: kUploadSuccessTxt,
        nameButton: kBackTxt,
        onPressed: () {
          Get.off(HomePage());
        },
      ));
      return;
    });
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
