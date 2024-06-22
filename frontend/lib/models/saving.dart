class Saving {
  int amount;
  String name;
  String date;
  String note;
  double saved;
  String? startedDate;

  Saving({
    required this.amount,
    required this.note,
    required this.name,
    required this.date,
    this.saved = 0.0,
    this.startedDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'note': note,
      'title': name,
      'date': date,
    };
  }

  factory Saving.fromJson(Map<String, dynamic> json) {
    return Saving(
      amount: json['amount'] as int? ?? 0, // Provide default value 0 if null
      note: json['note'] as String? ?? '', // Provide default value '' if null
      name: json['title'] as String? ?? '', // Provide default value '' if null
      date: json['date'] as String? ?? '', // Provide default value '' if null
      saved: json['saved'] != null
          ? json['saved'].toDouble()
          : 0.0, // Provide default value 0.0 if null
      startedDate:
          json['startedDate'] as String?, // If you want to keep this nullable
    );
  }
}
