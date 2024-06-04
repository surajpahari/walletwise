class Saving {
  int amount;
  String title;
  String date;
  String note;
  String? startedDate;

  Saving(
      {required this.amount,
      required this.note,
      required this.title,
      required this.date,
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
