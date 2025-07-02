import 'package:flutter/material.dart';
import 'package:my_portfolio/core/shared_widgets/models/social_links.dart';
import 'package:my_portfolio/core/utils/url_launcher.dart';
import 'social_icon.dart';

class SocialMediaLinks extends StatelessWidget {
  static const double _mobileBreakpoint = 800.0;
  static const double _leftPosition = 24.0;
  static const double _bottomPosition = 24.0;
  static const double _iconSpacing = 4.0;

  const SocialMediaLinks({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < _mobileBreakpoint;
    if (!isMobile) {
      return _buildDesktopSocialLinks();
    }
    return const SizedBox.shrink();
  }

  Widget _buildDesktopSocialLinks() {
    return Positioned(
      left: _leftPosition,
      bottom: _bottomPosition,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final link in kSocialLinks) ...[
            SocialMediaIcon(
              icon: link.icon, 
              onTap: () => launchExternalUrl(link.url),
            ),
            const SizedBox(height: _iconSpacing),
          ],
        ],
      ),
    );
  }
}
