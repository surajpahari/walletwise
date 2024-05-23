class Saving {
  int amount;
  String title;
  String date;
  String note;

  Saving(
      {required this.amount,
      required this.note,
      required this.title,
      required this.date});

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'note': note,
      'title': title,
      'date': date,
    };
  }
}
