import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:walletwise/data/balance_card.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});
  final Color main = const Color.fromRGBO(37, 150, 190, 1.0);
  String currentDate() {
    DateTime today = DateTime.now();
    String formattedDate = DateFormat('MMMM d yyyy').format(today);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(children: [
              Container(
                constraints: const BoxConstraints(
                    minWidth: 400, maxWidth: 500, maxHeight: 250),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [Color(0xff2517DB), Color(0xff1180D1)]),
                  borderRadius: BorderRadius.circular(
                      16.0), // Optional: Adds rounded corners
                ),
                child: Padding(
                    padding: const EdgeInsets.only(left: 24, top: 20),
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
                                          //Balance
                                          const Text("Balance",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20)),
                                          const SizedBox(height: 2),

                                          //Date
                                          Text(
                                            currentDate(),
                                            style:
                                                const TextStyle(fontSize: 16),
                                          ),
                                          const SizedBox(height: 20),
                                          Obx(() => Text(
                                                "Rs ${BalanceCardData.balance.toString()}.00",
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 24),
                                              )),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          //Obx(
                                          //  () => Text(
                                          //      'ok ${AssetDebtData.pieDataList[0].name}'),
                                          //),
                                          Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Color(0xff1f1a30),
                                                  borderRadius:
                                                      BorderRadius.circular(18),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(10),
                                                  child: Row(children: [
                                                    Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.green,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Icon(
                                                            Icons.north_east)),
                                                    SizedBox(
                                                      width: 10,
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
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            18)),
                                                child: Padding(
                                                  padding: EdgeInsets.all(10),
                                                  child: Row(children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.red,
                                                      ),
                                                      child: Icon(
                                                          Icons.south_west),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
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
