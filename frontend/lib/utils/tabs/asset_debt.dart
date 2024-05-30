import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/constants/app_colors.dart';
import 'package:walletwise/data/asset_debt_data.dart';
import 'package:walletwise/utils/charts/indicator.dart';
import 'package:walletwise/utils/charts/pie_chart.dart';

class AssetDebt extends StatefulWidget {
  const AssetDebt({Key? key}) : super(key: key);

  @override
  State<AssetDebt> createState() => _AssetDebtState();
}

class _AssetDebtState extends State<AssetDebt> {
  int _selectedIndex =
      0; // Initialize to 0 for "Asset" to be displayed by default

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: 300),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.purple,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Center(
                        child: Text(
                          "Assets",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                  },
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 300),
                    decoration: BoxDecoration(
                      color: AppColors.purple,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(children: [
                        Text(
                          "Debt",
                          style: TextStyle(
                              letterSpacing: 2,
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                              decorationThickness: 2),
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            constraints: BoxConstraints(maxWidth: 200, maxHeight: 300),
            child: _selectedIndex == 0
                ? MyPieChart(AssetDebtData.pieDataList)
                : MyPieChart(AssetDebtData.debtPieChartData),
          ),
          SizedBox(
            width: 30,
          ),
          _selectedIndex == 0
              ? Container(
                  child: Obx(() => Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: AssetDebtData.pieDataList
                            .asMap()
                            .entries
                            .map((entry) {
                          int index = entry.key;
                          var pieData = entry.value;
                          return Indicator(
                            color: AppColors.pieChartColors[index],
                            text: pieData.name,
                            isSquare: false,
                          );
                        }).toList(),
                      )),
                )
              : Container(
                  child: Obx(() => Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: AssetDebtData.debtPieChartData
                            .asMap()
                            .entries
                            .map((entry) {
                          int index = entry.key;
                          var pieData = entry.value;
                          return Indicator(
                            color: AppColors.pieChartColors[index],
                            text: pieData.name,
                            isSquare: false,
                          );
                        }).toList(),
                      )),
                )
        ])
      ],
    );
  }
}
