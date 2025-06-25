import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'social_icon.dart';

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
          SocialIcon(
            icon: FontAwesomeIcons.facebook,
            onTap: () => _launch('https://facebook.com/yourusername'),
            tooltip: '',
          ),
          const SizedBox(height: 4),
          SocialIcon(
            icon: FontAwesomeIcons.instagram,
            onTap: () => _launch('https://instagram.com/mahmoud_bakir__'),
            tooltip: '',
          ),
          const SizedBox(height: 4),
          SocialIcon(
            icon: FontAwesomeIcons.whatsapp,
            onTap: () => _launch('https://wa.me/201019594113'),
            tooltip: '',
          ),
          const SizedBox(height: 4),
          SocialIcon(
            icon: FontAwesomeIcons.github,
            onTap: () => _launch('https://github.com/Mahm0udbakir'),
            tooltip: '',
          ),
          const SizedBox(height: 4),
          SocialIcon(
            icon: FontAwesomeIcons.linkedinIn,
            onTap: () => _launch('https://www.linkedin.com/in/mahm0udbakir/'),
            tooltip: '',
          ),
        ],
      ),
    );
  }
}
