import 'package:flutter/material.dart';
import 'package:walletwise/utils/appbar/walletWiseBar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: WalletWiseBar.titleBar("Profile"));
  }
}
