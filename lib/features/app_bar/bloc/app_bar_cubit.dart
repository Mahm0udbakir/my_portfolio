import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_bar_state.dart';
part 'app_bar_cubit.freezed.dart';

class AppBarCubit extends Cubit<AppBarState> {
  AppBarCubit() : super(const AppBarState.initial());

  void changeSection(int index) {
    emit(AppBarState.section(index));
  }
} 