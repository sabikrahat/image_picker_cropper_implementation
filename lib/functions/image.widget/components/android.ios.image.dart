import 'dart:io';

import 'package:flutter/material.dart';

class AndroidIOSImage extends StatelessWidget {
  const AndroidIOSImage(this.file, {super.key});

  final File file;

  @override
  Widget build(BuildContext context) {
    return Image.file(file, fit: BoxFit.cover);
  }
}
