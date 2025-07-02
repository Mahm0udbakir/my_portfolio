import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  static const EdgeInsets _padding = EdgeInsets.only(top: 16, bottom: 24);
  static const double _avatarRadius = 28.0;
  static const double _iconSize = 32.0;
  static const Color _avatarBackgroundColor = Colors.white24;
  static const Color _iconColor = Colors.white;
  static const Color _nameColor = Colors.white;
  static const Color _professionColor = Color(0xFFB0B8C1);
  static const FontWeight _nameFontWeight = FontWeight.bold;

  final String name;
  final String profession;

  const InfoCard({
    super.key, 
    required this.name, 
    required this.profession,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _padding,
      child: ListTile(
        leading: _buildAvatar(),
        title: _buildName(),
        subtitle: _buildProfession(),
      ),
    );
  }

  Widget _buildAvatar() {
    return const CircleAvatar(
      radius: _avatarRadius,
      backgroundColor: _avatarBackgroundColor,
      child: Icon(
        Icons.person, 
        color: _iconColor, 
        size: _iconSize,
      ),
    );
  }

  Widget _buildName() {
    return Text(
      name,
      style: const TextStyle(
        color: _nameColor,
        fontWeight: _nameFontWeight,
      ),
    );
  }

  Widget _buildProfession() {
    return Text(
      profession,
      style: const TextStyle(color: _professionColor),
    );
  }
}
