import 'package:croppy/croppy.dart';
import 'package:flutter/material.dart';

import 'config/get_platform.dart';
import 'functions/image.process/pick.photo.dart';
import 'functions/image.widget/image.widget.dart';

void main() async {
  await _init();
  runApp(const App());
}

Future<void> _init() async {
  pt = PlatformInfo.getCurrentPlatformType();
  if (pt.isNotWeb) croppyForceUseCassowaryDartImpl = true;
}

class App extends StatelessWidget {
  const App({super.key});

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
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  dynamic _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlutterImage Process'),
      ),
      body: Center(
        child: _image != null
            ? SizedBox(
                width: 300,
                height: 300,
                child: ImageWidget(_image!),
              )
            : const Text('No image selected.'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_a_photo),
        onPressed: () async =>
            await pickPhoto(context).then((pk) => setState(() => _image = pk)),
      ),
    );
  }
}
