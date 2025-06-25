part of 'app_bar_bloc.dart';

@freezed
class AppBarEvent with _$AppBarEvent {
  const factory AppBarEvent.sectionChanged(int index) = SectionChanged;
} 