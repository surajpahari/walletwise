class TransactionCardData {
  final String title;
  final int amount;
  final String identifier;
  final String date;
  final String type;
  TransactionCardData(
      {required this.title,
      required this.identifier,
      required this.amount,
      required this.date,
      required this.type});

  factory TransactionCardData.fromJson(Map<String, dynamic> json) {
    return TransactionCardData(
        title: json['name'] as String? ?? '',
        amount: json['amount'] as int? ?? 0,
        identifier: json['identifier'] as String? ?? '',
        date: json['date'] as String? ?? '',
        type: json['type'] as String? ?? '');
  }
}
