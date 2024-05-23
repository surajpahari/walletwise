import 'package:flutter/material.dart';
import 'package:walletwise/theme/theme_constant.dart';
import 'package:walletwise/utils/appbar/walletWiseBar.dart';

class DebtForm extends StatelessWidget {
  const DebtForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: myTheme,
        child: Scaffold(
          appBar: WalletWiseBar.normalPageBar("Add Saving Goal"),
          body: Container(child: Text("Hi")),
        ));
  }
}
