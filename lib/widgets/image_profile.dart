import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:veggytably_driver/controllers/profile_controller.dart';

class ImageProfile extends StatelessWidget {
  const ImageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    void showModal() {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text('Camera'),
                  onTap: () async {
                    ProfileController.to.uploadImage(ImageSource.camera);
                    Get.back();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.image),
                  title: const Text('Gallery'),
                  onTap: () async {
                    ProfileController.to.uploadImage(ImageSource.gallery);
                    Get.back();
                  },
                ),
              ],
            );
          });
    }

    return Obx(() {
      if (ProfileController.to.isLoading.value) {
        return const CircularProgressIndicator();
      }
      return Center(
        child: Stack(
          children: [
            Obx(() {
              if (ProfileController.to.imageData.value.isNotEmpty) {
                return CircleAvatar(
                  radius: 48,
                  backgroundImage:
                      MemoryImage(ProfileController.to.imageData.value),
                );
              }
              return const CircleAvatar(
                radius: 48,
                backgroundImage: AssetImage("assets/images/profile.png"),
              );
            }),
            Positioned(
              bottom: 4,
              right: 20,
              child: InkWell(
                onTap: () {
                  showModal();
                },
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.teal,
                  size: 28,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
