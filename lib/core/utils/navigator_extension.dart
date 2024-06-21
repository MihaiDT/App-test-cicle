import 'package:flutter/material.dart';

extension NavigatorExtension on NavigatorState {
  /// Navigate to a new screen and remove all screens above it until a specified screen is reached.
  /// routeName: The name of the new screen to navigate to.
  /// routeNameToRemoveUntil: The name of the screen to return to.
  Future<void> pushNamedAndRemoveUntilSpecifiedRoute({
    required String routeName,
    required String routeNameToRemoveUntil,
  }) {
    // Use the pushNamedAndRemoveUntil method to navigate to the new screen
    // and remove the previous screens based on the filter function.
    return this.pushNamedAndRemoveUntil(
      routeName,
      (route) {
        final String? routeName = route.settings.name;
        if (routeName != null) {
          // Check if the name of the current screen matches the name
          // of the screen to return to.
          if (routeName == routeNameToRemoveUntil) {
            return true;
          } else {
            return false;
          }
        }
        // If the name of the current screen is not available, keep
        // this screen and all previous screens in the stack.

        return true;
      },
    );
  }
}
