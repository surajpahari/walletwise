import 'package:flutter/material.dart';
import 'package:walletwise/constants/app_colors.dart';

const List<String> list = <String>[
  'Last 7 days',
  'Last 30 days',
  'Last 90 days'
];

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.teal[800] // Darker color for a more seamless blend
              ),
          child: DropdownButton(
            value: dropdownValue,
            underline: const SizedBox.shrink(),
            dropdownColor:
                Colors.teal[800], // Darker color for a more seamless blend
            elevation: 0,
            items: const [
              DropdownMenuItem(
                value: 'Last 7 days',
                child: Text(
                  "Last 7 days",
                  style: TextStyle(
                      color: Colors.white, fontSize: 14), // Slimmer text
                ),
              ),
              DropdownMenuItem(
                value: 'Last 30 days',
                child: Text(
                  "Last 30 days",
                  style: TextStyle(
                      color: Colors.white, fontSize: 14), // Slimmer text
                ),
              ),
              DropdownMenuItem(
                value: 'Last 100 days',
                child: Text(
                  "Last 100 days",
                  style: TextStyle(
                      color: Colors.white, fontSize: 14), // Slimmer text
                ),
              ),
            ],
            onChanged: (String? value) {
              setState(() {
                dropdownValue = value!;
              });
            },
          ),
        ),
      ],
    );
  }
}
