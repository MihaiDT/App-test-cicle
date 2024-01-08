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
        return 'Lines';
      case Flavor.prod:
        return 'Lines';
      default:
        return 'Lines';
    }
  }
}
