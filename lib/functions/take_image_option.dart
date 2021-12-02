import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> takeImageOption(
    {required ImageSource source, bool isCircle = false}) async {
  File? _file;
  try {
    XFile? image = await ImagePicker().pickImage(
      source: source,
      imageQuality: 70,
    );
    if (image == null) return _file;
    _file = File(image.path);
  } on PlatformException catch (e) {
    _file = null;
    debugPrint('No Image found. Error: ' + e.toString());
  }

  debugPrint('Image Found: ' + _file.toString());

  //crop image
  if (_file != null) {
    File? croppedFile = await ImageCropper.cropImage(
      sourcePath: _file.path,
      cropStyle: isCircle ? CropStyle.circle : CropStyle.rectangle,
      aspectRatioPresets: [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
      ],
      androidUiSettings: AndroidUiSettings(
        toolbarTitle: "Crop",
        toolbarColor: Colors.blue,
        toolbarWidgetColor: Colors.grey[350],
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: false,
      ),
      iosUiSettings: const IOSUiSettings(
        title: 'Crop',
      ),
    );
    if (croppedFile != null) {
      _file = File(croppedFile.path);
      debugPrint('Image Crop Found: ' + croppedFile.toString());
      return _file;
    }
  }
  return _file;
}
