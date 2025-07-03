import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_bar_state.dart';
part 'app_bar_cubit.freezed.dart';

class AppBarCubit extends Cubit<AppBarState> {
  AppBarCubit() : super(const AppBarState.sideMenuState(isClosed: true, sectionIndex: 0));

  void changeSection(int index) {
    emit(AppBarState.sideMenuState(isClosed: state.maybeWhen(
      sideMenuState: (isClosed, _) => isClosed,
      orElse: () => true,
    ), sectionIndex: index));
  }

  void toggleSideMenu() {
    state.maybeWhen(
      sideMenuState: (isClosed, sectionIndex) {
        emit(AppBarState.sideMenuState(isClosed: !isClosed, sectionIndex: sectionIndex));
      },
      orElse: () {},
    );
  }
} 