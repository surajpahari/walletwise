import 'package:flutter/material.dart';
import 'package:walletwise/models/payment.dart';

class PaymentScreen extends StatefulWidget {
  final Payment payment;
  const PaymentScreen({required this.payment, super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
