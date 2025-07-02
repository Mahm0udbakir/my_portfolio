import 'package:rive/rive.dart';

/// Data model for Rive animation assets used in navigation.
/// 
/// Represents a navigation menu item with its associated
/// Rive animation artboard, state machine, and metadata.
class RiveAsset {
  final String artboard;
  final String stateMachineName;
  final String title;
  final String src;
  late SMIBool? input;

  RiveAsset(
    this.src, {
    required this.artboard,
    required this.stateMachineName,
    required this.title,
    this.input,
  });
}

/// Navigation menu items with their associated Rive animations.
/// 
/// Contains all the menu items for the side navigation,
/// each with its own Rive animation configuration.
final List<RiveAsset> sideMenus = [
  RiveAsset(
    "assets/RiveAssets/icons.riv",
    artboard: "HOME",
    stateMachineName: "HOME_interactivity",
    title: "Home",
  ),
  RiveAsset(
    "assets/RiveAssets/icons.riv",
    artboard: "USER",
    stateMachineName: "USER_Interactivity",
    title: "About",
  ),
  RiveAsset(
    "assets/RiveAssets/icons.riv",
    artboard: "SETTINGS",
    stateMachineName: "SETTINGS_Interactivity",
    title: "Work",
  ),
  RiveAsset(
    "assets/RiveAssets/icons.riv",
    artboard: "LIKE/STAR",
    stateMachineName: "STAR_Interactivity",
    title: "Skills",
  ),
  RiveAsset(
    "assets/RiveAssets/icons.riv",
    artboard: "AUDIO",
    stateMachineName: "AUDIO_Interactivity",
    title: "Reviews",
  ),
  RiveAsset(
    "assets/RiveAssets/icons.riv",
    artboard: "CHAT",
    stateMachineName: "CHAT_Interactivity",
    title: "Contact",
  ),
]; 