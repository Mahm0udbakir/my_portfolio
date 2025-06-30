import 'package:flutter/material.dart';

class AnimatedSideMenuPositioned extends StatelessWidget {
  final bool isMobile;
  final bool isClosed;
  final double maxOffset;
  final Widget child;

  const AnimatedSideMenuPositioned({
    Key? key,
    required this.isMobile,
    required this.isClosed,
    required this.maxOffset,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!isMobile) return const SizedBox.shrink();
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      curve: Curves.fastOutSlowIn,
      width: maxOffset,
      right: isClosed ? -maxOffset : 0,
      top: 0,
      bottom: 0,
      child: child,
    );
  }
} 