// Suggested alternative name: VerticalSectionScroller or SectionPageView
// This widget is responsible for vertical section navigation and synchronization with the app bar/navigation dots.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../app_bar/cubit/app_bar_cubit.dart';

/// A vertically scrollable page view that synchronizes with the app's navigation state.
///
/// - Provides vertical navigation between sections.
/// - Listens to [AppBarCubit] to animate to the correct section.
/// - Updates [AppBarCubit] when the user scrolls manually.
class Scroller extends StatefulWidget {
  static const Duration _animationDuration = Duration(milliseconds: 500);
  static const Curve _animationCurve = Curves.easeInOut;
  
  final List<Widget> sections;
  
  const Scroller({
    super.key,
    required this.sections,
  });

  @override
  State<Scroller> createState() => _ScrollerState();
}

class _ScrollerState extends State<Scroller> {
  late final PageController _controller;
  int _currentPage = 0;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    _controller.addListener(_onScroll);
  }

  /// Handles scroll events and updates the navigation state if needed.
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
          section: (index) => _handleSectionChange(index),
          sideMenuState: (_, sectionIndex) => _handleSectionChange(sectionIndex),
          orElse: () {},
        );
      },
      child: PageView(
        controller: _controller,
        scrollDirection: Axis.vertical,
        onPageChanged: _handlePageChanged,
        children: widget.sections,
      ),
    );
  }

  /// Animates to the given section index if not already there.
  Future<void> _handleSectionChange(int index) async {
    if (_controller.hasClients && _controller.page?.round() != index) {
      _isAnimating = true;
      await _controller.animateToPage(
        index,
        duration: Scroller._animationDuration,
        curve: Scroller._animationCurve,
      );
      _isAnimating = false;
    }
  }

  /// Updates the navigation state when the user scrolls manually.
  void _handlePageChanged(int index) {
    if (!_isAnimating) {
      context.read<AppBarCubit>().changeSection(index);
    }
  }
} 