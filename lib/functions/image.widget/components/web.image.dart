import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WebImage extends StatelessWidget {
  const WebImage(this.bytes, {super.key});

  final Uint8List bytes;

  @override
  Widget build(BuildContext context) => Image.memory(bytes, fit: BoxFit.cover);
}
