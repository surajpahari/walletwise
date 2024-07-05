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
    return Row(children: [
      Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.lowDarkBlue,
          ),
          child: DropdownButton(
            value: dropdownValue,
            underline: const SizedBox.shrink(),
            dropdownColor: AppColors.lowDarkBlue,
            elevation: 0,
            //alignment: AlignmentDirectional.bottomEnd,
            items: const [
              DropdownMenuItem(
                //alignment: AlignmentDirectional.bottomEnd,
                value: 'Last 7 days',
                child: Text("Last 7 days"),
              ),
              DropdownMenuItem(
                //alignment: AlignmentDirectional.bottomEnd,
                value: 'Last 30 days',
                child: Text("Last 30 days"),
              ),
              DropdownMenuItem(
                //alignment: AlignmentDirectional.bottomEnd,
                value: 'Last 20 days',
                child: Text("Last 100 days"),
              )
            ],

            onChanged: (String? value) {
              setState(() {
                dropdownValue = value!;
              });
            },
          ))
    ]);
  }
}
