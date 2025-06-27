import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/app_bar_cubit.dart';
import '../../../utils/text_styles.dart';
import '../../../utils/strings.dart';

class LogoButton extends StatelessWidget {
  const LogoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.read<AppBarCubit>().changeSection(0),
      child: Text(
        MyAppStrings.logoTitle,
        style: MyTextStyles.montserrat70028primary,
      ),
    );
  }
} 