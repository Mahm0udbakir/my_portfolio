import 'package:flutter/material.dart';
import 'package:my_portfolio/core/shared_widgets/side_menu/rive_assets.dart';
import 'package:rive/rive.dart';

class SideMenuTile extends StatelessWidget {
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
        AnimatedPositioned(
          duration: const Duration(milliseconds: 250),
          right: 0,
          height: 56,
          width: isActive ? MediaQuery.of(context).size.width * 0.70 : 0,
          curve: Curves.fastOutSlowIn,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xff6792ff),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: onTap,
            leading: SizedBox(
              height: 34,
              width: 34,
              child: RiveAnimation.asset(
                menu.src,
                artboard: menu.artboard,
                onInit: riveOnInit,
              ),
            ),
            title: Text(
              menu.title,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
