import 'package:flutter/material.dart';
import 'package:my_portfolio/core/shared_widgets/side_menu/info_card.dart';
import 'package:my_portfolio/core/shared_widgets/side_menu/side_menu_tile.dart';
import 'package:rive/rive.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: double.infinity,
        color: const Color(0x00021c4d),
        child: SafeArea(
          child: Column(
            children: [
              InfoCard(name: 'Mahmoud Bakir', profession: 'ACS Owner'),
              SideMenuTile(),
            ],
          ),
        ),
      ),
    );
  }
}
