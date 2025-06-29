import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AccountLinks extends StatelessWidget {
  const AccountLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.instagram, color: Colors.white, size: 28),
            onPressed: () {}, // TODO: Add your link
          ),
          const SizedBox(width: 16),
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.whatsapp, color: Colors.white, size: 28),
            onPressed: () {},
          ),
          const SizedBox(width: 16),
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.github, color: Colors.white, size: 28),
            onPressed: () {},
          ),
          const SizedBox(width: 16),
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.linkedinIn, color: Colors.white, size: 28),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
} 