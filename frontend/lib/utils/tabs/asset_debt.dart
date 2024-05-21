import 'package:flutter/material.dart';
import 'package:walletwise/utils/charts/chart_data.dart';
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
          constraints: BoxConstraints(maxWidth: 400),
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
                      color: _selectedIndex == 0
                          ? Color(0xFF424242)
                          : Color(0xFF00695C),
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
                    constraints: const BoxConstraints(maxWidth: 500),
                    decoration: BoxDecoration(
                      color: _selectedIndex == 1
                          ? Color(0xFF424242)
                          : Color(0xFF00695C),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Center(
                        child: Text(
                          "Debt",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Container(
          constraints: BoxConstraints(maxWidth: 400, maxHeight: 300),
          child: _selectedIndex == 0
              ? MyPieChart([
                  PieData(name: "Dikshyant", value: 100),
                  PieData(name: "Shivaji", value: 1000)
                ])
              : MyPieChart([
                  PieData(name: "Macbook", value: 200),
                  PieData(name: "RealState", value: 1000)
                ]),
        )
      ],
    );
  }
}
