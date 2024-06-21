import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/controllers/budget/asset_controller.dart';
import 'package:walletwise/theme/theme_constant.dart';
import 'package:walletwise/utils/appbar/walletWiseBar.dart';
import 'package:walletwise/utils/gaps/Xgap.dart';
import 'package:walletwise/utils/texfields/ww_submit.dart';
import 'package:walletwise/utils/texfields/ww_textfield.dart';
import 'package:walletwise/utils/validators/validation.dart';

class AddAssetForm extends StatelessWidget {
  const AddAssetForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AssetController();
    return Theme(
      data: myTheme,
      child: Scaffold(
        appBar: WalletWiseBar.normalPageBar("Add Asset "),
        body: Form(
          key: controller.formKey,
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 300),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  gapY('md'),
                  WwTextfield(
                      label: "Name",
                      controller: controller.title,
                      icon: const Icon(Icons.title),
                      validator: (value) {
                        return null;
                      }),
                  WwTextfield(
                      label: "Amount",
                      controller: controller.amount,
                      icon: const Icon(Icons.attach_money),
                      validator: (value) {
                        return null;
                      }),
                  gapY("md"),
                  WwSubmit(
                    onPressed: () {
                      print(controller.formState.value);
                      controller.addAssets(context);
                    },
                    child: Obx(
                      () => controller.formState.value == 1
                          ? const Column(
                              children: [
                                Text(
                                  "Adding",
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.white),
                                ),
                                LinearProgressIndicator(color: Colors.white),
                              ],
                            )
                          : const Text(
                              "Add",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
