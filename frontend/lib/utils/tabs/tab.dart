import 'package:flutter/material.dart';
import 'package:walletwise/constants/app_colors.dart';

class WwTab extends StatefulWidget {
  String tab1;
  String tab2;
  Widget tab1Screen;
  Widget tab2Screen;

  WwTab(
      {Key? key,
      required this.tab1,
      required this.tab2,
      required this.tab1Screen,
      required this.tab2Screen})
      : super(key: key);

  @override
  State<WwTab> createState() => _WwTabState();
}

class _WwTabState extends State<WwTab> {
  int _selectedIndex =
      0; // Initialize to 0 for "Asset" to be displayed by default

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
                      color: AppColors.purple,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Center(
                        child: Text(
                          widget.tab1,
                          style: _selectedIndex == 0
                              ? const TextStyle(
                                  letterSpacing: 2,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 2)
                              : const TextStyle(
                                  fontSize: 20, color: Colors.white),
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
                    constraints: const BoxConstraints(maxWidth: 300),
                    decoration: BoxDecoration(
                      color: AppColors.purple,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(children: [
                        Text(
                          widget.tab2,
                          style: _selectedIndex == 1
                              ? TextStyle(
                                  letterSpacing: 2,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 2)
                              : TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        _selectedIndex == 0 ? widget.tab1Screen : widget.tab2Screen,
      ],
    );
  }
}
