import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker_cropper_implementation/functions/modal_bottom_sheet_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _image;
  @override
  Widget build(BuildContext context) {
    // debugPrint('Image Build: ' + _image.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
      ),
      body: Center(
        child: _image != null
            ? Image.file(
                _image!,
                width: 300,
                height: 300,
              )
            : const Text('No image selected.'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_a_photo),
        onPressed: () async {
          _image = await modalBottomSheetMenu(context: context);
          setState(() {});
          debugPrint('Image Build: ' + _image.toString());
        },
      ),
    );
  }
}
