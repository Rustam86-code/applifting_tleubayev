import 'package:flutter/material.dart';

class FocusAbsorber extends StatelessWidget {
  const FocusAbsorber({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: (_) {
        final current = FocusScope.of(context);
        if (current.hasFocus) {
          current.unfocus();
        }
      },
      child: child,
    );
  }
}
