import 'package:flutter/material.dart';

class UpToDownTransition extends StatelessWidget {
  const UpToDownTransition({super.key, required this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      transitionBuilder: (child, animation) => SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 1),
          end: const Offset(0, 0),
        ).animate(animation),
        child: child,
      ),
      child: child,
    );
  }
}
