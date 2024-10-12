import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../utils/extensions/extensions.dart';

Future<File?> takeImageOption(
  BuildContext context,
  ImageSource source, {
  bool isCircle = false,
  int imageQuality = 100,
  List<CropAspectRatioPreset>? aspectRatioPresets,
}) async {
  File? file;
  final toolbarColor = context.theme.primaryColor;

  try {
    await ImagePicker()
        .pickImage(source: source, imageQuality: imageQuality)
        .then((XFile? image) {
      if (image == null) return file;
      file = File(image.path);
    });
  } on PlatformException catch (e) {
    file = null;
    debugPrint('No Image found. Error: $e');
  }

  debugPrint('Image Found: $file');

  if (file == null) return null;

  //crop image
  CroppedFile? croppedFile = await ImageCropper().cropImage(
    sourcePath: file!.path,
    uiSettings: [
      AndroidUiSettings(
        toolbarTitle: 'Crop',
        toolbarColor: toolbarColor,
        toolbarWidgetColor: Colors.grey[350],
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: false,
        cropStyle: isCircle ? CropStyle.circle : CropStyle.rectangle,
        aspectRatioPresets: aspectRatioPresets ??
            [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio16x9,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio5x3,
              CropAspectRatioPreset.ratio5x4,
              CropAspectRatioPreset.ratio7x5,
            ],
      ),
      IOSUiSettings(
        title: 'Crop',
        cropStyle: isCircle ? CropStyle.circle : CropStyle.rectangle,
        aspectRatioPresets: aspectRatioPresets ??
            [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio16x9,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio5x3,
              CropAspectRatioPreset.ratio5x4,
              CropAspectRatioPreset.ratio7x5,
            ],
      ),
    ],
  );
  if (croppedFile == null) return file;
  file = File(croppedFile.path);
  debugPrint('Image Crop Found: $croppedFile');
  return file;
}
