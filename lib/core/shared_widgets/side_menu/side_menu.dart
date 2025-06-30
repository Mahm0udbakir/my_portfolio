import 'package:flutter/material.dart';
import 'package:my_portfolio/core/shared_widgets/constants/social_links.dart';
import 'package:my_portfolio/core/shared_widgets/side_menu/cubit/side_menu_cubit.dart';
import 'package:my_portfolio/core/shared_widgets/side_menu/info_card.dart';
import 'package:my_portfolio/core/shared_widgets/side_menu/rive_assets.dart';
import 'package:my_portfolio/core/shared_widgets/side_menu/cubit/section_header.dart';
import 'package:my_portfolio/core/shared_widgets/side_menu/rive_utils.dart';
import 'package:my_portfolio/core/shared_widgets/side_menu/side_menu_tile.dart';
import 'package:my_portfolio/core/shared_widgets/widgets/functions.dart';
import 'package:my_portfolio/core/shared_widgets/widgets/social_icons.dart';
import 'package:rive/rive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/social_icon.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: double.infinity,
        color: const Color(0xff021c4d),
        child: SafeArea(
          child: BlocBuilder<SideMenuCubit, SideMenuState>(
            builder: (context, state) {
              return Column(
                children: [
                  InfoCard(name: 'Mahmoud Bakir', profession: 'ACS Owner'),
                  SectionHeader(text: 'Sections'),
                  const SizedBox(height: 16),
                  ...sideMenus.map(
                    (item) => SideMenuTile(
                      menu: item,
                      isActive: state.selectedMenu == item,
                      riveOnInit: (artboard) {
                        final controller = RiveUtils.getRiveController(
                          artboard,
                          stateMachineName: item.stateMachineName,
                        );
                        item.input =
                            controller?.findInput<bool>('active') as SMIBool?;
                      },
                      onTap: () {
                        if (item.input != null) {
                          item.input!.change(true);
                          Future.delayed(const Duration(milliseconds: 800), () {
                            item.input!.change(false);
                          });
                        }
                        context.read<SideMenuCubit>().selectMenu(item);
                      },
                    ),
                  ),
                  SectionHeader(text: 'Accounts'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (final link in kSocialLinks) ...[
                          SocialIcon(
                            icon: link.icon,
                            onTap: () => launchIt(link.url),
                            color: Colors.white,
                          ),
                          const SizedBox(width: 16),
                        ],
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
