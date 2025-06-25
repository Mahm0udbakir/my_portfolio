import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app_bar/bloc/app_bar_cubit.dart';

class SinglePagePortfolio extends StatefulWidget {
  final List<Widget> sections;
  const SinglePagePortfolio({super.key, required this.sections});

  @override
  State<SinglePagePortfolio> createState() => _SinglePagePortfolioState();
}

class _SinglePagePortfolioState extends State<SinglePagePortfolio> {
  late final PageController _controller;
  int _currentPage = 0;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    _controller.addListener(_onScroll);
  }

  void _onScroll() {
    if (_isAnimating) return; // Prevent feedback loop
    final newPage = _controller.page?.round() ?? 0;
    if (newPage != _currentPage) {
      _currentPage = newPage;
      context.read<AppBarCubit>().changeSection(_currentPage);
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_onScroll);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBarCubit, AppBarState>(
      listenWhen: (prev, curr) => prev != curr,
      listener: (context, state) async {
        state.maybeWhen(
          section: (index) async {
            if (_controller.hasClients && _controller.page?.round() != index) {
              _isAnimating = true;
              await _controller.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
              _isAnimating = false;
            }
          },
          orElse: () {},
        );
      },
      child: PageView(
        controller: _controller,
        scrollDirection: Axis.vertical,
        children: widget.sections,
        onPageChanged: (index) {
          if (!_isAnimating) {
            context.read<AppBarCubit>().changeSection(index);
          }
        },
      ),
    );
  }
} 