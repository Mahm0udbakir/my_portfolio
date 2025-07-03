import 'package:flutter/material.dart';

class SideMenuAnimation extends StatelessWidget {
  static const Duration _animationDuration = Duration(milliseconds: 200);
  static const Curve _animationCurve = Curves.fastOutSlowIn;
  static const double _closedPosition = 0.0;

  final bool isMobile;
  final bool isClosed;
  final double maxOffset;
  final Widget child;

  const SideMenuAnimation({
    super.key,
    required this.isMobile,
    required this.isClosed,
    required this.maxOffset,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (!isMobile) return const SizedBox.shrink();
    
    return AnimatedPositioned(
      duration: _animationDuration,
      curve: _animationCurve,
      width: maxOffset,
      right: isClosed ? -maxOffset : _closedPosition,
      top: 0,
      bottom: 0,
      child: child,
    );
  }
} 