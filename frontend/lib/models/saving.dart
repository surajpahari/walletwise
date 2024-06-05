class Saving {
  int amount;
  String title;
  String date;
  String note;
  double saved = 0.0;
  String? startedDate;

  Saving(
      {required this.amount,
      required this.note,
      required this.title,
      required this.date,
      this.saved = 0.0,
      this.startedDate});

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'note': note,
      'title': title,
      'date': date,
    };
  }
}
