import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:veggytably_driver/controllers/profile_controller.dart';
import 'package:veggytably_driver/views/upload_pic.dart';

class ImageProfile extends StatefulWidget {
  const ImageProfile({super.key});

  @override
  State<ImageProfile> createState() => _ImageProfileState();
}

class _ImageProfileState extends State<ImageProfile> {
  XFile? _imageFile;
  final ImagePicker picker = ImagePicker();

  Future<void> takePhoto(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile == null) return;
    setState(() {
      _imageFile = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.put(ProfileController());

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
                    await takePhoto(ImageSource.camera);
                    if (_imageFile == null) print("null");

                    // upload image
                    // profileController.uploadImage(ImageSource.camera);
                    Get.back();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.image),
                  title: const Text('Gallery'),
                  onTap: () async {
                    await takePhoto(ImageSource.gallery);
                    if (_imageFile == null) print("null");
                    Get.back();
                  },
                ),
              ],
            );
          });
    }

    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 48,
            backgroundImage: _imageFile == null
                ? Image.asset('assets/images/profile.png').image
                : Image.file(File(_imageFile!.path)).image,
          ),
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
  }
}
