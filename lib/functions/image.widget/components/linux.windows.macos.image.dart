import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class LinuxWindowsMacOsImage extends StatelessWidget {
  const LinuxWindowsMacOsImage(this.platformFile, {super.key});

  final PlatformFile platformFile;

  @override
  Widget build(BuildContext context) {
    return Image.file(File(platformFile.path!), fit: BoxFit.cover);
  }
}
