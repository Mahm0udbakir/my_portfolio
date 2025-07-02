import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Data model for social media links.
/// 
/// Represents a social media profile with its URL
/// and associated icon for display purposes.
class SocialLink {
  final String url;
  final IconData icon;

  /// Creates a SocialLink with the given URL and icon.
  /// 
  /// [url] The URL to the social media profile.
  /// [icon] The FontAwesome icon to display for this social link.
  const SocialLink({
    required this.url, 
    required this.icon,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SocialLink && 
           other.url == url && 
           other.icon == icon;
  }

  @override
  int get hashCode => url.hashCode ^ icon.hashCode;

  @override
  String toString() => 'SocialLink(url: $url, icon: $icon)';
}

/// Social media profile links for the portfolio.
/// 
/// Contains all the social media profiles that will be
/// displayed in the side menu and other parts of the app.
const List<SocialLink> kSocialLinks = [
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