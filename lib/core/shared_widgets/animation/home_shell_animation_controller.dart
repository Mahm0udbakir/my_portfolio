import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/core/shared_widgets/app_bar/cubit/app_bar_cubit.dart';
import 'package:my_portfolio/core/layout/main_layout.dart';

/// Animation controller for the home shell that manages side menu animations.
/// 
/// Handles the animation logic for the main shell including translation,
/// scaling, and coordination with the AppBarCubit state.
class HomeShellAnimationController extends StatefulWidget {
  static const Duration _animationDuration = Duration(milliseconds: 200);
  static const double _translateBegin = 0.0;
  static const double _translateEnd = 0.87;
  static const double _scaleBegin = 1.0;
  static const double _scaleEnd = 0.92;
  static const Curve _animationCurve = Curves.fastOutSlowIn;

  const HomeShellAnimationController({super.key});

  @override
  State<HomeShellAnimationController> createState() =>
      _HomeShellAnimationControllerState();
}

class _HomeShellAnimationControllerState
    extends State<HomeShellAnimationController>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _translateAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    _animationController = AnimationController(
      vsync: this,
      duration: HomeShellAnimationController._animationDuration,
    );
    
    _translateAnimation = Tween<double>(
      begin: HomeShellAnimationController._translateBegin, 
      end: HomeShellAnimationController._translateEnd,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: HomeShellAnimationController._animationCurve,
      ),
    );
    
    _scaleAnimation = Tween<double>(
      begin: HomeShellAnimationController._scaleBegin, 
      end: HomeShellAnimationController._scaleEnd,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: HomeShellAnimationController._animationCurve,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBarCubit, AppBarState>(
      listener: _handleStateChanges,
      child: BlocBuilder<AppBarCubit, AppBarState>(
        builder: _buildHomeShell,
      ),
    );
  }

  void _handleStateChanges(BuildContext context, AppBarState state) {
    final isClosed = _extractIsClosedState(state);
    if (isClosed) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  Widget _buildHomeShell(BuildContext context, AppBarState state) {
    final isClosed = _extractIsClosedState(state);
    return MainLayout(
      animationController: _animationController,
      translateAnimation: _translateAnimation,
      scaleAnimation: _scaleAnimation,
      isMenuClosed: isClosed,
    );
  }

  bool _extractIsClosedState(AppBarState state) {
    return state.maybeWhen(
      sideMenuState: (isClosed, _) => isClosed,
      orElse: () => true,
    );
  }
} 