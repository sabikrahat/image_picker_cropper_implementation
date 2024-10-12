

part of '../extensions.dart';

extension PlatformFileExt on PlatformFile {
  Future<String> get base64 async => base64Encode(bytes!);

  File get toFile => File(path!);
}

extension PlatformFilesExt on List<PlatformFile> {
  List<File> get toFiles => map((e) => e.toFile).toList();
}

extension FilePickerResultExt on FilePickerResult {
  List<File> get toFiles => paths.map((e) => File(e!)).toList();
}
