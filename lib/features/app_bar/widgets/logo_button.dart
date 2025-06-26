import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app_bar/bloc/app_bar_cubit.dart';
import '../../../core/app_colors.dart';

class LogoButton extends StatelessWidget {
  const LogoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.read<AppBarCubit>().changeSection(0),
      child: Text(
        'BAKIR',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 28,
          color: AppColors.primary,
          letterSpacing: 2,
        ),
      ),
    );
  }
} 