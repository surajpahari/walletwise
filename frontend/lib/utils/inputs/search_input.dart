import 'package:flutter/material.dart';

typedef SearchKeyExtractor = String Function(dynamic item);
typedef OnSelectionCallback = void Function(dynamic selectedItem);

class SearchInput extends StatefulWidget {
  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20), // Make the border rounded
    borderSide: const BorderSide(color: Colors.white),
  );

  final String? label;
  final List<dynamic> searchList;
  final SearchKeyExtractor searchKeyExtractor;
  final OnSelectionCallback onSelection;

  SearchInput({
    Key? key,
    this.label,
    required this.searchList,
    required this.onSelection,
    required this.searchKeyExtractor,
  }) : super(key: key);

  @override
  _SearchInputState createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  late TextEditingController _searchController;
  String selectedOption = '';

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _showOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        List<String> options = widget.searchList
            .map((item) => widget.searchKeyExtractor(item))
            .toList();

        List<String> filteredOptions = options.where((option) {
          return option
              .toLowerCase()
              .contains(_searchController.text.toLowerCase());
        }).toList();

        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: SingleChildScrollView(
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
                      border: widget.border,
                      enabledBorder: widget.border,
                      focusedBorder: widget.border,
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (filteredOptions.isEmpty)
                    const Center(
                      child: Text(
                        'No options found',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  if (filteredOptions.isNotEmpty)
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: filteredOptions
                            .map((option) => ListTile(
                                  title: Text(
                                    option,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  onTap: () {
                                    final selectedItem =
                                        widget.searchList.firstWhere(
                                      (item) =>
                                          widget.searchKeyExtractor(item) ==
                                          option,
                                    );
                                    setState(() {
                                      selectedOption = option;
                                      _searchController.text = option;
                                    });
                                    widget.onSelection(
                                        selectedItem); // Pass selected item to callback
                                    Navigator.pop(context); // Close the dialog
                                  },
                                ))
                            .toList(),
                      ),
                    ),
                ],
              ),
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
        labelStyle: const TextStyle(color: Colors.white), // Label color
        border: widget.border,
        enabledBorder: widget.border,
        focusedBorder: widget.border,
      ),
      controller: _searchController..text = selectedOption,
    );
  }
}
