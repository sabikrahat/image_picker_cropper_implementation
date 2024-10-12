part of '../extensions.dart';

extension ColorFilterExt on Color? {
  ColorFilter? get toColorFilter =>
      this == null ? null : ColorFilter.mode(this!, BlendMode.srcIn);
}
