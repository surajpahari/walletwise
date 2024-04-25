class Income {
  int amount;
  String category;
  String date;

  Income({required this.amount, required this.category, required this.date});

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'category': category,
      'date': date,
    };
  }
}
