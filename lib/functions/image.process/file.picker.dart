import 'dart:ui';

import 'package:croppy/croppy.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../config/constants.dart';
import '../../../../utils/extensions/extensions.dart';
import '../../../../utils/logger/logger_helper.dart';
import '../../config/get_platform.dart';

Future<Uint8List?> filePickFromDevice(
  BuildContext context,
  int imageQuality,
) async {
  try {
    final filePickerResult = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      dialogTitle: appName,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
      allowMultiple: false,
      compressionQuality: imageQuality,
    );

    if (filePickerResult == null || filePickerResult.files.isEmpty) return null;

    // return filePickerResult.files.single;

    Uint8List bytes = pt.isWeb
        ? filePickerResult.files.first.bytes!
        : await filePickerResult.files.first.toFile.readAsBytes();

    if (!context.mounted) return null;
    final CropImageResult? cropRes = await showMaterialImageCropper(
      context,
      imageProvider: MemoryImage(bytes),
    );

    if (cropRes == null) return null;

    return await cropRes.uiImage
        .toByteData(format: ImageByteFormat.png)
        .then((byteData) => byteData!.buffer.asUint8List());
  } on PlatformException catch (e) {
    log.e('No Image found. Error: $e');
    return null;
  }
}
