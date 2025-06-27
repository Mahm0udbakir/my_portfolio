import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/social_links.dart';
import 'package:my_portfolio/core/shared_widgets/widgets/social_icon.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({super.key});

  void _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    if (isMobile) return const SizedBox.shrink();
    return Positioned(
      left: 24,
      bottom: 24,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final link in kSocialLinks) ...[
            SocialIcon(
              icon: link.icon,
              onTap: () => _launch(link.url),
            ),
            const SizedBox(height: 4),
          ],
        ],
      ),
    );
  }
} 