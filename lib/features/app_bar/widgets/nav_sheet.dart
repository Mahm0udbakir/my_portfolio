import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavSheet extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;
  final List<String> items = ['Home', 'About', 'Work', 'Skills', 'Reviews', 'Contact'];
  final List<IconData> icons = [
    FontAwesomeIcons.houseChimney, 
    FontAwesomeIcons.userLarge,    
    FontAwesomeIcons.briefcase,    
    FontAwesomeIcons.screwdriverWrench, 
    FontAwesomeIcons.solidCommentDots,  
    FontAwesomeIcons.paperPlane,   
  ];

  NavSheet({super.key, required this.selectedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.7),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 24,
                offset: Offset(0, -8),
              ),
            ],
            border: Border.all(color: Colors.white.withOpacity(0.2)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 5,
                margin: EdgeInsets.only(bottom: 24),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              ...List.generate(items.length, (i) {
                final isSelected = i == selectedIndex;
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                  margin: EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      Navigator.pop(context);
                      onTap(i);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            icons[i],
                            color: isSelected ? Colors.blue : Colors.grey[700],
                            size: 20,
                          ),
                          SizedBox(height: 6),
                          Text(
                            items[i],
                            style: TextStyle(
                              color: isSelected ? Colors.blue : Colors.grey[800],
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}   