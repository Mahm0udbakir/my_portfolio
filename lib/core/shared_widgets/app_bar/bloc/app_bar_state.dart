part of 'app_bar_cubit.dart';

@freezed
class AppBarState with _$AppBarState {
  const factory AppBarState.initial() = _Initial;
  const factory AppBarState.section(int index) = _Section;
} 