import 'dart:convert';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:veggytably_driver/api/driver_api.dart';
import 'package:veggytably_driver/models/authentication_response.dart';

class ProfileController extends GetxController {
  static ProfileController to = Get.find();
  RxString username = "username".obs;
  RxString phone = "phone".obs;
  var isLoading = false.obs;
  final Rx<Uint8List> imageData = Uint8List(0).obs;

  void uploadImage(ImageSource imageSource) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: imageSource);
      isLoading(true);
      if (pickedFile != null) {
        var response =
            await DriverApi.instance.uploadImageFile(pickedFile.path);

        if (response != null || response.statusCode == 200) {
          final data = response.data['data'];
          final imageBase64 = data['profilePicture'];
          final imageData = base64.decode(imageBase64);
          print("size: ${imageData.lengthInBytes}");

          ProfileController.to.setImage(imageData);

          Get.snackbar('Success', 'Image uploaded successfully');
        } else if (response.statusCode == 401) {
          Get.offAllNamed('/sign_up');
        } else {
          Get.snackbar('Failed', 'Error Code: ${response.statusCode}');
        }
      } else {
        Get.snackbar('Failed', 'Image not selected');
      }
    } finally {
      isLoading(false);
    }
  }

  void setUser(User user) {
    username.value = user.username;
    phone.value = user.phone;
    update();
  }

  void setImage(Uint8List image) {
    imageData.value = image;
    update();
  }
}
