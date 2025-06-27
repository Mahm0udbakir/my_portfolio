import 'package:flutter/material.dart';
import '../../utils/text_styles.dart';
import '../../utils/strings.dart';

class CopyrightsTag extends StatelessWidget {
  final Widget child;
  const CopyrightsTag({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
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
                children: [
                  Text(
                    '\u00a9',
                    style: MyTextStyles.montserrat50020black,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    MyAppStrings.copyright,
                    style: MyTextStyles.montserrat50014black,
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Text(
                MyAppStrings.allRightsReserved,
                style: MyTextStyles.montserrat40013black,
              ),
            ],
          ),
          ),
        ),
      ],
    );
  }
} 