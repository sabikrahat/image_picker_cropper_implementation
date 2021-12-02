import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'take_image_option.dart';

Future<File?> modalBottomSheetMenu(
    {required BuildContext context, bool isCircle = false}) async {
  File? file;
  showModalBottomSheet(
    elevation: 2.0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
      ),
    ),
    context: context,
    builder: (builder) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 30.0),
            child: Text(
              'Choose an Option',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.photo_camera),
            title: const Text('Capture Image With Camera'),
            onTap: () async {
              file = await takeImageOption(
                source: ImageSource.camera,
                isCircle: isCircle,
              );
              if (file != null) {
                Navigator.pop(context, file);
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text('Select Image From Gallery'),
            onTap: () async {
              file = await takeImageOption(
                source: ImageSource.gallery,
                isCircle: isCircle,
              );
              if (file != null) {
                Navigator.pop(context, file);
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.cancel),
            title: const Text('Cancel'),
            onTap: () {
              Navigator.pop(context, file);
            },
          ),
        ],
      );
    },
  );
}
