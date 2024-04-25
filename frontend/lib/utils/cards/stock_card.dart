import 'package:flutter/material.dart';

class StockCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.grey[850],
        boxShadow: [
          BoxShadow(
            color: Colors.grey[800]!,
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
        border: Border.all(
          color: Colors.grey[800]!,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'AAPL',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Text color
                ),
              ),
              Text(
                '\$123.45',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Text color
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Text(
            'Apple Inc.',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey[400], // Lighter text color
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            '+1.23 (1.00%)',
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
                    '\$122.34',
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
                    '\$124.56',
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
                    '\$121.78',
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
    );
  }
}
