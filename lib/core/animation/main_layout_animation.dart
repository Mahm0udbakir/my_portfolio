import 'dart:math';
import 'package:flutter/material.dart';

class MainLayoutAnimation extends StatelessWidget {
  static const double _perspectiveValue = 0.001;
  static const double _rotationAngle = -30.0;
  static const double _radiansPerDegree = pi / 180;
  static const double _borderRadius = 24.0;
  static const double _noTransformValue = 0.0;

  final Animation<double> translateAnimation;
  final Animation<double> scaleAnimation;
  final AnimationController animationController;
  final double maxOffset;
  final Widget child;

  const MainLayoutAnimation({
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
      transform: _buildTransformMatrix(),
      child: Transform.translate(
        offset: _buildTranslationOffset(),
        child: Transform.scale(
          scale: scaleAnimation.value,
          child: _buildClippedChild(),
        ),
      ),
    );
  }

  Matrix4 _buildTransformMatrix() {
    return Matrix4.identity()
      ..setEntry(3, 2, _perspectiveValue)
      ..rotateY(translateAnimation.value * _rotationAngle * _radiansPerDegree);
  }

  Offset _buildTranslationOffset() {
    return Offset(translateAnimation.value * -maxOffset, _noTransformValue);
  }

  Widget _buildClippedChild() {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(
          animationController.value == _noTransformValue 
            ? _noTransformValue 
            : _borderRadius,
        ),
      ),
      child: child,
    );
  }
} 