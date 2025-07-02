import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/core/shared_widgets/app_bar/cubit/app_bar_cubit.dart';
import 'package:my_portfolio/core/utils/app_colors.dart';

class MobileMenuButton extends StatelessWidget {
  final double top;
  final double right;
  final bool isClosed;

  const MobileMenuButton({
    super.key,
    this.top = 16,
    this.right = 24,
    required this.isClosed,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      child: IconButton(
        icon: Icon(
          isClosed ? FontAwesomeIcons.sliders : FontAwesomeIcons.xmark,
          color: isClosed ? AppColors.primary : Colors.white,
        ),
        onPressed: () {
          context.read<AppBarCubit>().toggleSideMenu();
        },
      ),
    );
  }
}