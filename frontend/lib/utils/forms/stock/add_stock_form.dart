import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/controllers/stocks/stock_add_controller.dart';
import 'package:walletwise/utils/date_picker.dart';
import 'package:walletwise/utils/gaps/Xgap.dart';
import 'package:walletwise/utils/texfields/ww_submit.dart';
import 'package:walletwise/utils/texfields/ww_textfield.dart';

class AddStockForm extends StatelessWidget {
  final int stockId;
  final dynamic controller;
  AddStockForm({required this.stockId})
      : controller = StockAddController(stockId: stockId);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WwTextfield(
            label: "No of units",
            controller: controller.unit,
            icon: const Icon(Icons.update),
            validator: (value) {
              return null;
            }),
        gapY("md"),
        DatePicker(
          label: "BoughtAt",
          controller:
              controller.boughtDate, // Ensure this is a TextEditingController
          firstDate: DateTime(2000),
          lastDate: DateTime.now(),
        ),
        gapY("md"),
        WwTextfield(
            label: "Unit Price",
            controller: controller.price,
            icon: const Icon(Icons.title),
            validator: (value) {
              return null;
            }),
        gapY("md"),
        WwSubmit(
            onPressed: () {
              controller.addBoughtStock(context);
            },
            child: Obx(
              () => controller.formState.value == 1
                  ? const Column(
                      children: [
                        Text(
                          "Adding",
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                        LinearProgressIndicator(color: Colors.white),
                      ],
                    )
                  : const Text(
                      "Add",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
            ))
      ],
    );
  }
}
