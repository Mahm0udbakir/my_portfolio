import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedMainTransform extends StatelessWidget {
  final Animation<double> translateAnimation;
  final Animation<double> scaleAnimation;
  final AnimationController animationController;
  final double maxOffset;
  final Widget child;

  const AnimatedMainTransform({
    super.key,
    required this.translateAnimation,
    required this.scaleAnimation,
    required this.animationController,
    required this.maxOffset,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateY(translateAnimation.value * -30 * pi / 180),
      child: Transform.translate(
        offset: Offset(translateAnimation.value * -maxOffset, 0),
        child: Transform.scale(
          scale: scaleAnimation.value,
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(animationController.value == 0 ? 0 : 24),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
} 