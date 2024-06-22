import 'package:flutter/material.dart';

class CustomSearchAndSelectTextField extends StatefulWidget {
  final List<String> options;
  final void Function(String selectedOption)? onOptionSelected;
  final String? label;

  const CustomSearchAndSelectTextField({
    Key? key,
    this.label,
    required this.options,
    this.onOptionSelected,
  }) : super(key: key);

  @override
  _CustomSearchAndSelectTextFieldState createState() =>
      _CustomSearchAndSelectTextFieldState();
}

class _CustomSearchAndSelectTextFieldState
    extends State<CustomSearchAndSelectTextField> {
  String selectedOption = '';
  TextEditingController textEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();
  List<String> filteredOptions = [];

  @override
  void initState() {
    super.initState();
    filteredOptions.addAll(widget.options);
    textEditingController.addListener(onSearchTextChanged);
  }

  @override
  void dispose() {
    textEditingController.removeListener(onSearchTextChanged);
    focusNode.dispose();
    super.dispose();
  }

  void onSearchTextChanged() {
    String text = textEditingController.text.toLowerCase();
    setState(() {
      filteredOptions = widget.options.where((option) {
        return option.toLowerCase().contains(text);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: textEditingController,
          focusNode: focusNode,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            labelText: widget.label ?? "Search",
            hintText: 'Type to search and select',
            prefixIcon: const Icon(Icons.search),
            suffixIcon: focusNode.hasFocus
                ? IconButton(
                    icon: const Icon(Icons.arrow_upward),
                    onPressed: () {
                      setState(() {
                        focusNode.unfocus();
                      });
                    },
                  )
                : null,
          ),
          onTap: () {
            setState(() {
              filteredOptions = widget.options;
            });
          },
          onSubmitted: (text) {
            if (filteredOptions.isNotEmpty) {
              setState(() {
                selectedOption = filteredOptions[0];
                textEditingController.text = selectedOption;
              });
              if (widget.onOptionSelected != null) {
                widget.onOptionSelected!(selectedOption);
              }
            }
          },
          onChanged: (text) {
            // No need to update filteredOptions here, as it's updated in onSearchTextChanged
          },
          onEditingComplete: () {
            // Handle editing complete if needed
          },
        ),
        if (filteredOptions.isNotEmpty)
          Container(
            constraints: const BoxConstraints(maxHeight: 150.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filteredOptions.length,
              itemBuilder: (context, index) {
                final option = filteredOptions[index];
                return ListTile(
                  title: Text(option),
                  onTap: () {
                    setState(() {
                      selectedOption = option;
                      textEditingController.text = option;
                    });
                    if (widget.onOptionSelected != null) {
                      widget.onOptionSelected!(selectedOption);
                    }
                  },
                );
              },
            ),
          ),
      ],
    );
  }
}
