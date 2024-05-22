import 'package:flutter/material.dart';
import 'package:walletwise/utils/cards/stock_card.dart';
import 'package:walletwise/theme/theme_constant.dart';

class StockScreen extends StatelessWidget {
  const StockScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: myTheme,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[800]!,
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
                gradient: LinearGradient(
                  colors: [Color(0xFFF9603E), Color(0xFFE86C51)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                children: [
                  Icon(
                    Icons.whatshot,
                    color: Colors.white,
                    size: 30,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Hot Stocks",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    StockCard(),
                    StockCard(),
                    StockCard(),
                    StockCard(),
                    StockCard(),
                    StockCard(),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FloatingActionButton(
            onPressed: () => {
              showDialog(
                  context: context,
                  builder: (context) {
                    return (Theme(
                        data: ThemeData.dark(),
                        child: AlertDialog(content: Container())));
                  })
            },
            child: const Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
