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
      title: json['title'] as String,
      dueDuration: json['dueDuration'] as String,
      totalPay: json['totalPay'] as int,
      totalSaved: json['totalSaved'] as int,
    );
  }
}
