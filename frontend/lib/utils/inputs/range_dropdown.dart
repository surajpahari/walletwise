import 'package:flutter/material.dart';
import 'package:walletwise/constants/app_colors.dart';

class RangeDropdown extends StatelessWidget {
  const RangeDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
          decoration: BoxDecoration(
            color: AppColors.lowDarkBlue,
          ),
          child: DropdownButton(
            focusColor: AppColors.lowDarkBlue,
            underline: const SizedBox.shrink(),
            dropdownColor: AppColors.lowDarkBlue,
            elevation: 0,
            alignment: AlignmentDirectional.bottomEnd,
            items: const [
              DropdownMenuItem(
                alignment: AlignmentDirectional.bottomEnd,
                value: 'hi',
                child: Text("Last 7 days"),
              ),
              DropdownMenuItem(
                alignment: AlignmentDirectional.bottomEnd,
                value: 'hi',
                child: Text("Last 30 days"),
              ),
              DropdownMenuItem(
                alignment: AlignmentDirectional.bottomEnd,
                value: 'hi',
                child: Text("Last 100 days"),
              )
            ],
            onChanged: (String? value) {},
          ))
    ]);
  }
}
