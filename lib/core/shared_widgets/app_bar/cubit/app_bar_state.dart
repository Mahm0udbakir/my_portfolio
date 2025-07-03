part of 'app_bar_cubit.dart';

@freezed
class AppBarState with _$AppBarState {
  const factory AppBarState.sideMenuState({
    required bool isClosed,
    required int sectionIndex,
  }) = _SideMenuState;
}
