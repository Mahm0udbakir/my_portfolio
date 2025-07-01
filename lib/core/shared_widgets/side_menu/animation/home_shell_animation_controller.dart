
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_portfolio/core/shared_widgets/app_bar/cubit/app_bar_cubit.dart';
import 'package:my_portfolio/core/routes/home_shell.dart';

class HomeShellAnimationController extends StatefulWidget {
  final GoRouterState? state;
  const HomeShellAnimationController({super.key, this.state});

  @override
  State<HomeShellAnimationController> createState() => _HomeShellAnimationControllerState();
}

class _HomeShellAnimationControllerState extends State<HomeShellAnimationController>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _translateAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _translateAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
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
      listener: (context, state) {
        final isClosed = state.maybeWhen(
          sideMenuState: (isClosed, _) => isClosed,
          orElse: () => true,
        );
        if (isClosed) {
          _animationController.reverse();
        } else {
          _animationController.forward();
        }
      },
      child: BlocBuilder<AppBarCubit, AppBarState>(
        builder: (context, state) {
          final isClosed = state.maybeWhen(
            sideMenuState: (isClosed, _) => isClosed,
            orElse: () => true,
          );
          return HomeShell(
            animationController: _animationController,
            translateAnimation: _translateAnimation,
            scaleAnimation: _scaleAnimation,
            isClosed: isClosed,
          );
        },
      ),
    );
  }
}
