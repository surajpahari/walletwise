class BankAccount {
  String name;
  String? type;
  String? accountNumber;
  double amount;
  BankAccount({required this.name, this.amount = 0, this.accountNumber});
}
