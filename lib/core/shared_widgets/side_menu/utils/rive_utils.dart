import 'package:flutter/foundation.dart';
import 'package:rive/rive.dart';

/// Utility class for managing Rive animation controllers.
/// 
/// Provides helper methods for creating and configuring
/// Rive state machine controllers from artboards.
class RiveUtils {
  static const String _defaultStateMachineName = "State Machine 1";

  /// Creates and configures a Rive state machine controller from an artboard.
  /// 
  /// [artboard] The Rive artboard to create the controller from.
  /// [stateMachineName] The name of the state machine to use. 
  ///                    Defaults to "State Machine 1".
  /// 
  /// Returns the configured StateMachineController, or null if creation fails.
  static StateMachineController? getRiveController(
    Artboard artboard, {
    String stateMachineName = _defaultStateMachineName,
  }) {
    try {
      StateMachineController? controller =
          StateMachineController.fromArtboard(artboard, stateMachineName);
      
      if (controller != null) {
        artboard.addController(controller);
      }
      
      return controller;
    } catch (e) {
      // Log error for debugging
      if (kDebugMode) {
        print('Failed to create Rive controller: $e');
      }
      return null;
    }
  }
} 