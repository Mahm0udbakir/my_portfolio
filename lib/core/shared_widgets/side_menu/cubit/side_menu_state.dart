import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_portfolio/core/shared_widgets/constants/rive_assets.dart';

part 'side_menu_state.freezed.dart';

@freezed
class SideMenuState with _$SideMenuState {
  const factory SideMenuState({required RiveAsset selectedMenu}) = _SideMenuState;
} 