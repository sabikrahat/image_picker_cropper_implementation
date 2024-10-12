import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;
import 'package:flutter/material.dart';

late final PT pt;

class PlatformInfo {
  static PT getCurrentPlatformType() {
    if (kIsWeb) {
      return PT.isWeb;
    } else {
      if (defaultTargetPlatform == TargetPlatform.macOS) {
        return PT.isMacOS;
      } else if (defaultTargetPlatform == TargetPlatform.fuchsia) {
        return PT.isFuchsia;
      } else if (defaultTargetPlatform == TargetPlatform.linux) {
        return PT.isLinux;
      } else if (defaultTargetPlatform == TargetPlatform.windows) {
        return PT.isWindows;
      } else if (defaultTargetPlatform == TargetPlatform.iOS) {
        return PT.isIOS;
      } else if (defaultTargetPlatform == TargetPlatform.android) {
        return PT.isAndroid;
      }
    }

    return PT.isUnknown;
  }
}

enum PT {
  isWeb,
  isIOS,
  isAndroid,
  isMacOS,
  isFuchsia,
  isLinux,
  isWindows,
  isUnknown
}

extension PTExt on PT {
  String get name {
    switch (this) {
      case PT.isWeb:
        return 'Web';
      case PT.isIOS:
        return 'IOS';
      case PT.isAndroid:
        return 'Android';
      case PT.isMacOS:
        return 'MacOS';
      case PT.isFuchsia:
        return 'Fuchsia';
      case PT.isLinux:
        return 'Linux';
      case PT.isWindows:
        return 'Windows';
      case PT.isUnknown:
        return 'Unknown';
    }
  }

  bool get isWeb => this == PT.isWeb;

  bool get isIOS => this == PT.isIOS;

  bool get isAndroid => this == PT.isAndroid;

  bool get isMacOS => this == PT.isMacOS;

  bool get isFuchsia => this == PT.isFuchsia;

  bool get isLinux => this == PT.isLinux;

  bool get isWindows => this == PT.isWindows;

  bool get isUnknown => this == PT.isUnknown;

  bool get isMobile => this == PT.isIOS || this == PT.isAndroid;

  bool get isDesktop =>
      this == PT.isMacOS ||
      this == PT.isFuchsia ||
      this == PT.isLinux ||
      this == PT.isWindows;

  bool get isNotWeb => !isWeb;

  bool get isNotIOS => !isIOS;

  bool get isNotAndroid => !isAndroid;

  bool get isNotMacOS => !isMacOS;

  bool get isNotFuchsia => !isFuchsia;

  bool get isNotLinux => !isLinux;

  bool get isNotWindows => !isWindows;

  bool get isNotUnknown => !isUnknown;

  bool get isNotMobile => !isMobile;

  bool get isNotDesktop => !isDesktop;
}
