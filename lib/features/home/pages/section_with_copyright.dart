import 'package:flutter/material.dart';

class SectionWithCopyright extends StatelessWidget {
  final Color color;
  final String label;
  const SectionWithCopyright({required this.color, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: color,
      child: Stack(
        children: [
          Center(child: Text(label)),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 24, bottom: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        '\u00a9',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        '2025 MAHMOUD BAKIR',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    'ALL RIGHTS RESERVED',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
} 