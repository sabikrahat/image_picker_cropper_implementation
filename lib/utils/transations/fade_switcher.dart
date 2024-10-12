import 'package:flutter/material.dart';

class FadeSwitcherTransition extends StatelessWidget {
  const FadeSwitcherTransition({super.key, required this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(animation),
        child: child,
      ),
      child: child,
    );
  }
}
