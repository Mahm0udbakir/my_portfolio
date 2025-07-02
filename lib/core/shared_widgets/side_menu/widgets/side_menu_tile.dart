import 'package:flutter/material.dart';
import 'package:my_portfolio/core/shared_widgets/constants/rive_assets.dart';
import 'package:rive/rive.dart';

class SideMenuTile extends StatelessWidget {
  static const Duration _animationDuration = Duration(milliseconds: 250);
  static const double _tileHeight = 56.0;
  static const double _activeWidthMultiplier = 0.70;
  static const double _borderRadius = 10.0;
  static const double _padding = 8.0;
  static const double _iconSize = 34.0;
  static const Color _activeBackgroundColor = Color(0xff6792ff);
  static const Color _textColor = Colors.white;
  static const Curve _animationCurve = Curves.fastOutSlowIn;

  final RiveAsset menu;
  final bool isActive;
  final VoidCallback onTap;
  final ValueChanged<Artboard> riveOnInit;

  const SideMenuTile({
    super.key,
    required this.menu,
    required this.isActive,
    required this.onTap,
    required this.riveOnInit,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildAnimatedBackground(context),
        _buildMenuContent(),
      ],
    );
  }

  Widget _buildAnimatedBackground(BuildContext context) {
    return AnimatedPositioned(
      duration: _animationDuration,
      right: 0,
      height: _tileHeight,
      width: isActive ? MediaQuery.of(context).size.width * _activeWidthMultiplier : 0,
      curve: _animationCurve,
      child: Container(
        decoration: BoxDecoration(
          color: _activeBackgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
        ),
      ),
    );
  }

  Widget _buildMenuContent() {
    return Padding(
      padding: const EdgeInsets.all(_padding),
      child: ListTile(
        onTap: onTap,
        leading: _buildRiveIcon(),
        title: _buildTitle(),
      ),
    );
  }

  Widget _buildRiveIcon() {
    return SizedBox(
      height: _iconSize,
      width: _iconSize,
      child: RiveAnimation.asset(
        menu.src,
        artboard: menu.artboard,
        onInit: riveOnInit,
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      menu.title,
      style: const TextStyle(color: _textColor),
    );
  }
}
