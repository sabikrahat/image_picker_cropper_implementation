part of '../extensions.dart';

enum ScreenType { mobile, desktop }

extension BuildContextExtension on BuildContext {
  MediaQueryData get mq => MediaQuery.of(this);
  ThemeData get theme => Theme.of(this);
  NavigatorState get nav => Navigator.of(this);

  TextTheme get text => theme.textTheme;
  ColorScheme get color => theme.colorScheme;

  bool get isLightTheme => MediaQuery.platformBrightnessOf(this) == Brightness.light;
  bool get isDarkTheme => MediaQuery.platformBrightnessOf(this) == Brightness.dark;

  Size get size => MediaQuery.sizeOf(this);
  EdgeInsets get padding => MediaQuery.viewPaddingOf(this);
  double get height => size.height;
  double get width => size.width;

  bool get tooSmall => width < 350 || height < 500;

  bool get isAndroid => theme.platform == TargetPlatform.android;
  bool get isIOS => theme.platform == TargetPlatform.iOS;
  bool get isWindows => theme.platform == TargetPlatform.windows;
  bool get isLinux => theme.platform == TargetPlatform.linux;
  bool get isMacOS => theme.platform == TargetPlatform.macOS;
  bool get isDesktop => isWindows || isLinux || isMacOS;
  bool get isMobile => isAndroid || isIOS;

  ScreenType get screenType =>
      width > 900 ? ScreenType.desktop : ScreenType.mobile;

  bool get isScreenDesktop => screenType == ScreenType.desktop;

  bool get isScreenMobile => screenType == ScreenType.mobile;

  Future<T?> push<T>(Widget page) =>
      Navigator.of(this).push<T>(MaterialPageRoute(builder: (_) => page));

  Future<T?> fadePush<T>(Widget page) async =>
      await fadeMaterialPush(this, page);

  Future<T?> pushReplace<T>(Widget page) => Navigator.of(this)
      .pushReplacement<T, T?>(MaterialPageRoute(builder: (_) => page));

  Future<T?> pushRemoveUntil<T>(Widget page) =>
      Navigator.of(this).pushAndRemoveUntil<T>(
          MaterialPageRoute(builder: (_) => page), (_) => false);

  Future<T?> fadePushRemoveUntil<T>(Widget page) async =>
      await fadePushRemoveUntilM(this, page);

  Future<T?> fadePushReplace<T>(Widget page) async =>
      await fadePushReplaceM(this, page);

  void pop<T>([T? result]) => Navigator.of(this).pop(result);

  bool get canPop => Navigator.of(this).canPop();

  bool get canNotPop => !canPop;

  Future<T?> pushNamed<T>(String route) =>
      Navigator.of(this).pushNamed<T>(route);

  Future<T?> pushReplaceNamed<T>(String route) =>
      Navigator.of(this).pushReplacementNamed(route);

  Future<T?> pushNamedRemoveUntil<T>(String route) =>
      Navigator.of(this).pushNamedAndRemoveUntil<T>(route, (_) => false);
}

extension NavigatorStateExtension on NavigatorState {
  Future<T?> push<T>(Widget page) =>
      this.push<T>(MaterialPageRoute(builder: (_) => page));

  Future<T?> pushReplace<T>(Widget page) =>
      pushReplacement<T, T?>(MaterialPageRoute(builder: (_) => page));

  Future<T?> pushRemoveUntil<T>(Widget page) => pushAndRemoveUntil<T>(
      MaterialPageRoute(builder: (_) => page), (_) => false);

  void pop<T>([T? result]) => this.pop(result);

  Future<T?> pushNamed<T>(String route) => this.pushNamed<T>(route);

  Future<T?> pushReplaceNamed<T>(String route) => pushReplacementNamed(route);

  Future<T?> pushNamedRemoveUntil<T>(String route) =>
      pushNamedAndRemoveUntil<T>(route, (_) => false);
}
