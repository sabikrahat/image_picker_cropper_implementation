import 'package:flutter/material.dart';

class DownToUpTransition extends StatelessWidget {
  const DownToUpTransition({super.key, required this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      transitionBuilder: (child, animation) => SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0),
          end: const Offset(0, -1),
        ).animate(ReverseAnimation(animation)),
        child: child,
      ),
      child: child,
    );
  }
}
