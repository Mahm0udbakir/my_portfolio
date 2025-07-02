import 'package:flutter/material.dart';
import '../../utils/text_styles.dart';
import '../../utils/strings.dart';

class CopyrightTag extends StatelessWidget {
  static const EdgeInsets _padding = EdgeInsets.only(right: 24, bottom: 24);
  static const double _symbolTextSpacing = 4.0;
  static const double _textSpacing = 2.0;
  
  final Widget child;
  
  const CopyrightTag({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        _buildCopyrightNotice(),
      ],
    );
  }

  Widget _buildCopyrightNotice() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: _padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _buildCopyrightRow(),
            const SizedBox(height: _textSpacing),
            _buildRightsReservedText(),
          ],
        ),
      ),
    );
  }

  Widget _buildCopyrightRow() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '\u00a9',
          style: MyTextStyles.montserrat50020black,
        ),
        const SizedBox(width: _symbolTextSpacing),
        Text(
          MyAppStrings.copyright,
          style: MyTextStyles.montserrat50014black,
        ),
      ],
    );
  }

  Widget _buildRightsReservedText() {
    return Text(
      MyAppStrings.allRightsReserved,
      style: MyTextStyles.montserrat40013black,
    );
  }
} 