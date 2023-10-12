import 'dart:io';
import 'package:covid_19_project/controllers/upload_image_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UploadImageScreen extends StatelessWidget {
   UploadImageScreen({Key? key}) : super(key: key);
  final controller = Get.put(UploadImageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image'),
      ),
      body: Obx(
        () => ModalProgressHUD(
          inAsyncCall: controller.showSpinner.value,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  controller.getImage();
                },
                child: Container(
                  child: controller.image == null
                      ? Center(child: Text('Pick Image'))
                      : Container(
                          child: Center(
                            child: Image.file(
                              File(controller.image!.path).absolute,
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                ),
              ),
              SizedBox(height: 150),
              GestureDetector(
                onTap: () {
                  controller.uploadImage();
                },
                child: Container(
                  height: 50,
                  width: 200,
                  color: Colors.green,
                  child: Center(child: Text('Upload')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
