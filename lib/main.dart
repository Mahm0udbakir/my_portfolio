import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/app_theme.dart';
import 'core/app_router.dart';
import 'features/app_bar/bloc/app_bar_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.basic,
      child: BlocProvider(
        create: (_) => AppBarBloc(),
        child: MaterialApp.router(
          title: 'Bakir Portfolio',
          routerConfig: appRouter,
          theme: AppTheme.lightTheme,
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return _CustomCursorOverlay(child: child!);
          },
        ),
      ),
    );
  }
}

class _CustomCursorOverlay extends StatefulWidget {
  final Widget child;
  const _CustomCursorOverlay({required this.child});

  @override
  State<_CustomCursorOverlay> createState() => _CustomCursorOverlayState();
}

class _CustomCursorOverlayState extends State<_CustomCursorOverlay> {
  Offset? _cursorPosition;
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) => setState(() => _cursorPosition = event.position),
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: Stack(
        children: [
          widget.child,
          if (_hovering && _cursorPosition != null)
            Positioned(
              left: _cursorPosition!.dx,
              top: _cursorPosition!.dy,
              child: IgnorePointer(
                child: Image.asset(
                  'assets/cursor/watermelon_pointer.png',
                  width: 32,
                  height: 32,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
