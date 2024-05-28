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
                  gradient: LinearGradient(
                      colors: [Color(0xff2517DB), Color(0xff1180D1)]),
                  borderRadius: BorderRadius.circular(
                      16.0), // Optional: Adds rounded corners
                  boxShadow: [
                    //BoxShadow(
                    //  color: Colors.grey.withOpacity(0.5), // Shadow color
                    //  spreadRadius: 2, // Spread radius
                    //  blurRadius: 3, // Blur radius
                    //  offset: const Offset(0, 3), // Changes position of shadow
                    //),
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
                                              )),
                                          Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Color(0xff1f1a30),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(10),
                                                  child: Row(children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors.red,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                      child: Icon(
                                                          Icons.arrow_upward),
                                                    ),
                                                    Text("Rs 1001")
                                                  ]),
                                                ),
                                              ),

                                              SizedBox(
                                                  width:
                                                      16), // Add space between the two Container widgets
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Color(0xff1f1a30),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(10),
                                                  child: Row(children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors.red,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                      child: Icon(
                                                          Icons.arrow_upward),
                                                    ),
                                                    Text("Rs 1001")
                                                  ]),
                                                ),
                                              ),
                                            ],
                                          )
                                        ]),
                                  ],
                                ),
                              )
                            ],
                          )),
                        ),
                      ],
                    )),
              )
            ])));
  }
}
