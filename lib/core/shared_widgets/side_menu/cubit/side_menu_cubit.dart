import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../rive_assets.dart';

part 'side_menu_cubit.freezed.dart';

@freezed
class SideMenuState with _$SideMenuState {
  const factory SideMenuState({required RiveAsset selectedMenu}) = _SideMenuState;
}

class SideMenuCubit extends Cubit<SideMenuState> {
  SideMenuCubit() : super(SideMenuState(selectedMenu: sideMenus.first));

  void selectMenu(RiveAsset menu) {
    emit(SideMenuState(selectedMenu: menu));
  }
} 