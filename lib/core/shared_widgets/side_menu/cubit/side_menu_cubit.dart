import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/core/shared_widgets/constants/rive_assets.dart';
import 'package:my_portfolio/core/shared_widgets/side_menu/cubit/side_menu_state.dart';

class SideMenuCubit extends Cubit<SideMenuState> {
  SideMenuCubit() : super(SideMenuState(selectedMenu: sideMenus.first));

  void selectMenu(RiveAsset menu) {
    emit(SideMenuState(selectedMenu: menu));
  }
} 