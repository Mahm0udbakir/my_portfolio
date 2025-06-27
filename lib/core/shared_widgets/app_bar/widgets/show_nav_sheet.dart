import 'package:flutter/material.dart';
import 'nav_sheet.dart';

void showNavSheet(BuildContext context, int selectedIndex, Function(int) onTap) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      final width = MediaQuery.of(context).size.width;
      return Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 40),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(32)),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 90,
                    maxWidth: width < 500 ? width * 0.40 : 220,
                  ),
                  child: NavSheet(selectedIndex: selectedIndex, onTap: onTap),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
} 