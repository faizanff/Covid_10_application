import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UploadImageController extends GetxController {
  static UploadImageController get instance => Get.find();
  File? image;
  final _picker = ImagePicker();
  RxBool showSpinner = false.obs;

  Future<void> getImage() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      update();
    } else {
      print('no image selected');
    }
  }

  Future<void> uploadImage() async {
    showSpinner.value = true;
    update();

    var stream = new http.ByteStream(image!.openRead());
    stream.cast();

    var length = await image!.length();

    var uri = Uri.parse('https://fakestoreapi.com/products');

    var request = new http.MultipartRequest('POST', uri);

    request.fields['title'] = "Static title";

    var multiport = new http.MultipartFile(
      'image',
      stream,
      length,
    );

    request.files.add(multiport);

    var response = await request.send();

    print(response.stream.toString());
    if (response.statusCode == 200) {
      showSpinner.value = false;
      update();
      print('image uploaded');
    } else {
      print('failed');
      showSpinner.value = false;
      update();
    }
  }
}
