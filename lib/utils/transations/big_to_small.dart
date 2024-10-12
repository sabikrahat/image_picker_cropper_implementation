import 'package:flutter/material.dart';

class BigToSmallTransition extends StatelessWidget {
  const BigToSmallTransition({super.key, required this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      transitionBuilder: (child, animation) =>
          ScaleTransition(scale: animation, child: child),
      child: child,
    );
  }
}
