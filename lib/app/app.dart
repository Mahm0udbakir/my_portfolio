import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/core/routes/app_router.dart';
import '../core/utils/app_theme.dart';
import '../core/shared_widgets/app_bar/cubit/app_bar_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppBarCubit(),
      child: MaterialApp.router(
        title: 'Bakir Portfolio',
        routerConfig: portfolioRouter,
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
} 