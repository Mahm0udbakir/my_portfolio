import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialLink {
  final String url;
  final dynamic icon;
  const SocialLink({required this.url, required this.icon});
}

const List<SocialLink> kSocialLinks = [
  SocialLink(
    icon: FontAwesomeIcons.facebook,
    url: 'https://facebook.com/yourusername',
  ),
  SocialLink(
    icon: FontAwesomeIcons.instagram,
    url: 'https://instagram.com/mahmoud_bakir__',
  ),
  SocialLink(
    icon: FontAwesomeIcons.whatsapp,
    url: 'https://wa.me/201019594113',
  ),
  SocialLink(
    icon: FontAwesomeIcons.github,
    url: 'https://github.com/Mahm0udbakir',
  ),
  SocialLink(
    icon: FontAwesomeIcons.linkedinIn,
    url: 'https://www.linkedin.com/in/mahm0udbakir/',
  ),
];
