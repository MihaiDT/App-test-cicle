import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoutingObserver extends GetObserver {
  static RxList<Route<dynamic>> routeStack = RxList.empty();

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    routeStack.add(route);
    routeStack.refresh();
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    routeStack.remove(route);
    routeStack.refresh();
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    routeStack.add(route);
    routeStack.refresh();
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (oldRoute != null) {
      routeStack.remove(oldRoute);
      routeStack.refresh();
    }
    if (newRoute != null) {
      routeStack.add(newRoute);
      routeStack.refresh();
    }
  }
}
