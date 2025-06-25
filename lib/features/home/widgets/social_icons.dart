import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          _SocialIcon(
            icon: FontAwesomeIcons.facebook,
            onTap: () => _launch('https://facebook.com/yourusername'),
            tooltip: '',
          ),
          const SizedBox(height: 4),
          _SocialIcon(
            icon: FontAwesomeIcons.instagram,
            onTap: () => _launch('https://instagram.com/mahmoud_bakir__'),
            tooltip: '',
          ),
          const SizedBox(height: 4),
          _SocialIcon(
            icon: FontAwesomeIcons.whatsapp,
            onTap: () => _launch('https://wa.me/201019594113'),
            tooltip: '',
          ),
          const SizedBox(height: 4),
          _SocialIcon(
            icon: FontAwesomeIcons.github,
            onTap: () => _launch('https://github.com/Mahm0udbakir'),
            tooltip: '',
          ),
          const SizedBox(height: 4),
          _SocialIcon(
            icon: FontAwesomeIcons.linkedinIn,
            onTap: () => _launch('https://www.linkedin.com/in/mahm0udbakir/'),
            tooltip: '',
          ),
        ],
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final String tooltip;

  const _SocialIcon({
    required this.icon,
    required this.onTap,
    required this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(icon, color: Colors.grey[700], size: 20),
        ),
      ),
    );
  }
}
