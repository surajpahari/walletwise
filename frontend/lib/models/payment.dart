class Payment {
  String title;
  String dueDuration;
  int totalPay;
  int totalSaved;
  Payment(
      {required this.title,
      required this.dueDuration,
      required this.totalSaved,
      required this.totalPay});
  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      title: json['name'] as String,
      dueDuration: json['due'] as String,
      totalPay: json['amount'] as int,
      totalSaved: json['savings'] as int,
    );
  }
}
