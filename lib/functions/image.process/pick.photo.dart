import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

import '../../config/get_platform.dart';
import 'file.picker.dart';
import 'modal.bottom.sheet.menu.dart';

Future<Object?> pickPhoto(
  BuildContext context, {
  bool isCircle = false,
  List<CropAspectRatioPreset>? aspectRatioPresets,
  int imageQuality = 60,
}) async {
  if (pt.isMobile) {
    return await modalBottomSheetMenu(
      context,
      isCircle: isCircle,
      aspectRatioPresets: [CropAspectRatioPreset.square],
      imageQuality: imageQuality,
    );
  }
  return await filePickFromDevice(context, imageQuality);
}
