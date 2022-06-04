import 'dart:ui';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
class HomeController extends GetxController {
  //TODO: Implement HomeController

  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if(pickedFile!=null){
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value =
          ((File(selectedImagePath.value)).lengthSync()/ 1024 / 1024)
              .toStringAsFixed(2) +
              " Mb";
    } else {
      Get.snackbar('Error', 'No Image File',snackPosition: SnackPosition.BOTTOM,backgroundColor: Color.fromRGBO(22, 234, 77, 1));
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
