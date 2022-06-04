import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(() => controller.selectedImagePath.value == ''
                    ? Text('Select Image from gallery/camera')
                    : Image.file(File(controller.selectedImagePath.value))),
                SizedBox(height: 10,),
                Obx(()=>Text(controller.selectedImageSize.value==''?'':
                controller.selectedImageSize.value,)),
                TextButton(
                    onPressed: () {
                      controller.getImage(ImageSource.gallery);
                    },
                    child: Text('Gallery')),
                TextButton(
                    onPressed: () {
                      controller.getImage(ImageSource.camera);
                    },
                    child: Text('Camera')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
