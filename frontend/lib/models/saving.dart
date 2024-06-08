class Saving {
  int amount;
  String title;
  String date;
  String note;
  double saved;
  String? startedDate;

  Saving({
    required this.amount,
    required this.note,
    required this.title,
    required this.date,
    this.saved = 0.0,
    this.startedDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'note': note,
      'title': title,
      'date': date,
    };
  }

  factory Saving.fromJson(Map<String, dynamic> json) {
    return Saving(
      amount: json['amount'] as int,
      note: json['note'] as String,
      title: json['title'] as String,
      date: json['date'] as String,
      saved: json['saved'] != null ? json['saved'].toDouble() : 0.0,
      startedDate: json['startedDate'] as String?,
    );
  }
}
