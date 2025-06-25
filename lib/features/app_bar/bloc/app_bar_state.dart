part of 'app_bar_bloc.dart';

@freezed
class AppBarState with _$AppBarState {
  const factory AppBarState.initial() = _Initial;
  const factory AppBarState.section(int index) = _Section;
} 