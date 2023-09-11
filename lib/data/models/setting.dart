class Setting {
  final int androidMinBuildNumber;
  final int iosMinBuildNumber;
  final String iosStoreUrl;
  final String androidStoreUrl;
  // final Map<String, Map<String, dynamic>> groupsInfo;

  Setting({
    required this.androidMinBuildNumber,
    required this.iosMinBuildNumber,
    required this.iosStoreUrl,
    required this.androidStoreUrl,
    // required this.groupsInfo,
  });

  factory Setting.fromJson(Map json) {
    final setting = Setting(
      androidMinBuildNumber: json['android_min_build_number'],
      iosMinBuildNumber: json['ios_min_build_number'],
      androidStoreUrl: json['android_store_url'],
      iosStoreUrl: json['ios_store_url'],
      // groupsInfo: json['groups_info'],
    );

    return setting;
  }
}
