class WalletTransaction {
  final String title;
  final String formattedDate;
  final int coins;
  final String? imagePath;

  WalletTransaction({
    required this.title,
    required this.formattedDate,
    required this.coins,
    this.imagePath,
  });

  factory WalletTransaction.fromJson(Map<String, dynamic> json) {
    return WalletTransaction(
      title: json['title'],
      formattedDate: json['created_at'],
      coins: json['coins'] ?? 0,
      imagePath: json['image_path'],
    );
  }
}
