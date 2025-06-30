part of 'app_bar_cubit.dart';

@freezed
class AppBarState with _$AppBarState {
  const factory AppBarState.initial() = _Initial;
  const factory AppBarState.section(int index) = _Section;
  const factory AppBarState.sideMenuState({required bool isClosed, required int sectionIndex}) = _SideMenuState;
} 