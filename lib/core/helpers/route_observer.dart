import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/helpers/keyboard.dart';

class RoutingObserver extends GetObserver {
  static RxList<Route<dynamic>> routeStack = RxList.empty();

  @override
  void didPush(Route route, Route? previousRoute) {
    dismissKeyboard(Get.context!);
    super.didPush(route, previousRoute);
    routeStack.add(route);
    routeStack.refresh();
    dismissKeyboard(Get.context!);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    dismissKeyboard(Get.context!);
    super.didPop(route, previousRoute);
    routeStack.remove(route);
    routeStack.refresh();
    dismissKeyboard(Get.context!);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    dismissKeyboard(Get.context!);
    super.didRemove(route, previousRoute);
    routeStack.add(route);
    routeStack.refresh();
    dismissKeyboard(Get.context!);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    dismissKeyboard(Get.context!);
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (oldRoute != null) {
      routeStack.remove(oldRoute);
      routeStack.refresh();
    }
    if (newRoute != null) {
      routeStack.add(newRoute);
      routeStack.refresh();
    }
    dismissKeyboard(Get.context!);
  }
}
