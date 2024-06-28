import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/constants/app_colors.dart';
import 'package:walletwise/models/stock.dart';
import 'package:walletwise/screens/stock_detail.dart';

class StockCard extends StatelessWidget {
  final Stock stock;
  StockCard({required this.stock});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Get.to(StockDetail(stock: stock));
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: AppColors.lowDarkBlue,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    stock.symbol,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Text color
                    ),
                  ),
                  Text(
                    'Rs${stock.currentData?.low ?? ' ---'}',
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Text color
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Text(
                stock.name,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[400], // Lighter text color
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                '${stock.currentData?.increaseRate ?? '---'} (${stock.currentData?.increasePercent ?? '---'}%)',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.greenAccent, // Green text color
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Open',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey[400], // Lighter text color
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'Rs ${stock.currentData?.high ?? '---'}',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Text color
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'High',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey[400], // Lighter text color
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'Rs ${stock.currentData?.high ?? '---'}',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Text color
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Low',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey[400], // Lighter text color
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'Rs${stock.currentData?.low ?? ' ---'}',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Text color
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
