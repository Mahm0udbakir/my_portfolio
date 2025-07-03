// Suggested alternative name: NavigationSideMenu or SectionNavigationMenu
// This widget is responsible for displaying the navigation side menu with animated section tiles and social links.

import 'package:flutter/material.dart';
import 'package:my_portfolio/core/shared_widgets/constants/rive_assets.dart';
import 'package:my_portfolio/core/shared_widgets/models/social_links.dart';
import 'package:my_portfolio/core/shared_widgets/side_menu/cubit/side_menu_cubit.dart';
import 'package:my_portfolio/core/shared_widgets/side_menu/cubit/side_menu_state.dart';
import 'package:my_portfolio/core/shared_widgets/side_menu/utils/rive_utils.dart';
import 'package:my_portfolio/core/shared_widgets/side_menu/widgets/info_card.dart';
import 'package:my_portfolio/core/shared_widgets/side_menu/widgets/section_header.dart';
import 'package:my_portfolio/core/shared_widgets/side_menu/widgets/side_menu_tile.dart';
import 'package:my_portfolio/core/shared_widgets/widgets/social_icon.dart';
import 'package:my_portfolio/core/utils/app_colors.dart';
import 'package:my_portfolio/core/utils/url_launcher.dart';
import 'package:rive/rive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/core/shared_widgets/app_bar/cubit/app_bar_cubit.dart';
import 'package:my_portfolio/core/shared_widgets/constants/navigation_dots.dart';

/// A side navigation menu with animated section tiles and social links.
/// 
/// - Displays user info, section navigation, and social media links.
/// - Handles section selection, animation, and navigation.
class SideMenu extends StatelessWidget {
  static const double _sectionSpacing = 16.0;
  static const double _socialPadding = 8.0;
  static const double _socialIconSpacing = 16.0;
  static const Duration _animationDelay = Duration(milliseconds: 800);

  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: double.infinity,
        color: AppColors.darkBlue,
        child: SafeArea(
          child: BlocBuilder<SideMenuCubit, SideMenuState>(
            builder: (context, state) {
              return Column(
                children: [
                  _buildInfoCard(),
                  _buildSectionsHeader(),
                  const SizedBox(height: _sectionSpacing),
                  ..._buildMenuSections(state, context),
                  _buildAccountsHeader(),
                  _buildSocialLinks(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard() {
    return const InfoCard(
      name: 'Mahmoud Bakir',
      profession: 'ACS Owner',
    );
  }

  Widget _buildSectionsHeader() {
    return const SectionHeader(text: 'Sections');
  }

  List<Widget> _buildMenuSections(SideMenuState state, BuildContext context) {
    return sideMenus.map((RiveAsset item) => SideMenuSection(
      menu: item,
      isActive: state.selectedMenu == item,
      riveOnInit: (Artboard artboard) => _initializeRiveController(item, artboard),
      onTap: () => _handleMenuTap(item, context),
    )).toList();
  }

  /// Initializes the Rive controller for the given menu item and artboard.
  void _initializeRiveController(RiveAsset item, Artboard artboard) {
    final controller = RiveUtils.getRiveController(
      artboard,
      stateMachineName: item.stateMachineName,
    );
    item.input = controller?.findInput<bool>('active') as SMIBool?;
  }

  /// Handles menu item tap: triggers animation, updates state, and navigates.
  void _handleMenuTap(RiveAsset item, BuildContext context) {
    if (item.input != null) {
      item.input!.change(true);
      Future.delayed(_animationDelay, () {
        item.input!.change(false);
      });
    }
    context.read<SideMenuCubit>().selectMenu(item);
    // Navigate to the selected section (like web mode)
    final sectionIndex = _getSectionIndex(item);
    context.read<AppBarCubit>().changeSection(sectionIndex);
  }

  /// Maps menu items to their corresponding section indices.
  int _getSectionIndex(RiveAsset item) {
    final index = kNavigationSectionNames.indexOf(item.title);
    return index >= 0 ? index : 0;
  }

  Widget _buildAccountsHeader() {
    return const SectionHeader(text: 'Accounts');
  }

  Widget _buildSocialLinks() {
    return Padding(
      padding: const EdgeInsets.all(_socialPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (final link in kSocialLinks) ...[
            SocialMediaIcon(
              icon: link.icon,
              onTap: () => launchExternalUrl(link.url),
              color: Colors.white,
            ),
            const SizedBox(width: _socialIconSpacing),
          ],
        ],
      ),
    );
  }
} 