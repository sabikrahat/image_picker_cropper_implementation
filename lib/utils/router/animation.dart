import 'package:flutter/material.dart';

Future<T?> fadePush<T>(
  BuildContext context,
  Widget page, {
  RouteSettings? settings,
  Duration duration = const Duration(milliseconds: 150),
}) =>
    Navigator.push<T>(
      context,
      PageRouteBuilder<T>(
        settings: settings,
        transitionDuration: duration,
        pageBuilder: (_, __, ___) => page,
        transitionsBuilder: (_, animation, __, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    );

class HeroDialogRoute<T> extends PageRoute<T> {
  HeroDialogRoute({
    required this.builder,
    this.duration = const Duration(milliseconds: 300),
  }) : super();

  final WidgetBuilder builder;
  final Duration duration;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Duration get transitionDuration => duration;

  @override
  bool get maintainState => true;

  @override
  Color get barrierColor => Colors.black54;

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
        child: child,
      );

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) =>
      builder(context);

  @override
  String? get barrierLabel => null;
}
