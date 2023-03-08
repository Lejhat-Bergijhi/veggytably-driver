import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:veggytably_driver/api/driver_api.dart';

class ProfileController extends GetxController {
  static ProfileController instance = Get.find();
  var isLoading = false.obs;
  XFile? imageFile;
  // var imageURL = '';

  void uploadImage(ImageSource imageSource) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: imageSource);
      isLoading(true);
      if (pickedFile != null) {
        var response =
            await DriverApi.instance.uploadImageFile(pickedFile.path);

        if (response.statusCode == 200) {
          //get image url from api response
          // imageURL = response.data['user']['image'];
          imageFile = response.data['data']['profilePicture'];

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
}
