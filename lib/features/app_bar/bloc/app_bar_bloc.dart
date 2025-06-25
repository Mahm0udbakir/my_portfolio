import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_bar_event.dart';
part 'app_bar_state.dart';
part 'app_bar_bloc.freezed.dart';

class AppBarBloc extends Bloc<AppBarEvent, AppBarState> {
  AppBarBloc() : super(const AppBarState.initial()) {
    on<AppBarEvent>((event, emit) {
      event.when(
        sectionChanged: (index) => emit(AppBarState.section(index)),
      );
    });
  }
} 