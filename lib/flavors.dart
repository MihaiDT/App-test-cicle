enum Flavor {
  dev,
  prod,
}

/// Utils to check the current flavor
extension FlavorExtension on Flavor {
  bool get isDevFlavor => this == Flavor.dev;

  bool get isProdFlavor => this == Flavor.prod;
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'My Lines - DEV';
      case Flavor.prod:
        return 'My Lines';
      default:
        return 'My Lines';
    }
  }
}
