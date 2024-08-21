class TransactionCardData {
  final String title;
  final int amount;
  final String date;
  final String type;
  TransactionCardData(
      {required this.title,
      required this.amount,
      required this.date,
      required this.type});

  factory TransactionCardData.fromJson(Map<String, dynamic> json) {
    return TransactionCardData(
        title: json['name'] as String? ?? '',
        amount: json['amount'] as int? ?? 0,
        date: json['date'] as String? ??
            '', // Assuming date is a String, adjust if needed
        type: json['name'] as String? ?? '');
  }
}
