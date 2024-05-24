import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:walletwise/constants/app_colors.dart';
import 'package:walletwise/data/balance_card.dart';

class BalanceCard extends StatelessWidget {
  BalanceCard({super.key});
  final Color main = Color.fromRGBO(37, 150, 190, 1.0);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(children: [
              Container(
                constraints: const BoxConstraints(
                    minWidth: 400, maxWidth: 500, maxHeight: 200),
                decoration: BoxDecoration(
                  color: AppColors.darkGrey,
                  borderRadius: BorderRadius.circular(
                      16.0), // Optional: Adds rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Shadow color
                      spreadRadius: 2, // Spread radius
                      blurRadius: 3, // Blur radius
                      offset: const Offset(0, 3), // Changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Expanded(
                          child: Center(
                              child: Row(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                    color: Colors.transparent),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Balance",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20)),
                                          SizedBox(height: 2),
                                          Text(
                                            "May   01   2024",
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          SizedBox(height: 20),
                                          Obx(() => Text(
                                                "Rs ${BalanceCardData.balance.toString()}.00",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 24),
                                              ))
                                        ]),
                                  ],
                                ),
                              )
                            ],
                          )),
                        ),
                        Expanded(
                          child: Container(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                  child: Container(
                                constraints:
                                    const BoxConstraints(maxWidth: 150),
                                decoration: BoxDecoration(
                                  color: AppColors.lightgreen,
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(22.0),
                                    topLeft: Radius.circular(22.0),
                                  ),
                                ),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.trending_up,
                                            color: Colors.green,
                                          ),
                                          Text(
                                            "in",
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 18),
                                          ),
                                        ]),
                                    Text(
                                      "Rs 1001",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    ),
                                  ],
                                ),
                              )),
                              Expanded(
                                  child: Container(
                                constraints:
                                    const BoxConstraints(maxWidth: 150),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(22.0),
                                    bottomRight: Radius.circular(22.0),
                                  ),
                                  color: AppColors.lightgreen,
                                ),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.trending_down,
                                            color: Colors.red,
                                          ),
                                          Text(
                                            "out",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 18),
                                          ),
                                        ]),
                                    Text(
                                      "Rs 1001",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    ),
                                  ],
                                ),
                              ))
                            ],
                          )),
                        )
                      ],
                    )),
              )
            ])));
  }
}
