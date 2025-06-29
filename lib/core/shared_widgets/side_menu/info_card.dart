import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String name;
  final String profession;

  const InfoCard({super.key, required this.name, required this.profession});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 24),
      child: ListTile(
        leading: const CircleAvatar(
          radius: 28,
          backgroundColor: Colors.white24,
          child: Icon(Icons.person, color: Colors.white, size: 32),
        ),
        title: Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          profession,
          style: const TextStyle(color: Color(0xFFB0B8C1)),
        ),
        
      ),
    );
  }
}
