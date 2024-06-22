import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget {
  final String? label;

  const SearchInput({Key? key, this.label}) : super(key: key);

  @override
  _SearchInputState createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  TextEditingController _searchController = TextEditingController();
  String selectedOption = '';

  void _showOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        List<String> options = [
          'Option 1',
          'Option 2',
          'Option 3'
        ]; // Replace with your actual options

        List<String> filteredOptions = options.where((option) {
          return option
              .toLowerCase()
              .contains(_searchController.text.toLowerCase());
        }).toList();

        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _searchController,
                  onChanged: (value) {
                    setState(
                        () {}); // Trigger rebuild to update filtered options
                  },
                  style: const TextStyle(color: Colors.white), // Text color
                  decoration: InputDecoration(
                    labelText: "Search for ${widget.label ?? 'items'}",
                    labelStyle:
                        const TextStyle(color: Colors.white), // Label color
                    prefixIcon: const Icon(Icons.search,
                        color: Colors.white), // Icon color
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Colors.white), // Border color
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Colors.white), // Border color
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Colors.white), // Border color
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                if (filteredOptions.isEmpty)
                  Center(
                    child: Text(
                      'No options found',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                if (filteredOptions.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: filteredOptions
                        .map((option) => ListTile(
                              title: Text(
                                option,
                                style: TextStyle(color: Colors.white),
                              ),
                              onTap: () {
                                setState(() {
                                  selectedOption = option;
                                  _searchController.text = option;
                                });
                                Navigator.pop(context); // Close the dialog
                              },
                            ))
                        .toList(),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      onTap: () {
        _showOptionsDialog(context);
      },
      decoration: InputDecoration(
        labelText: widget.label ?? "Search",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      controller: TextEditingController(text: selectedOption),
    );
  }
}
