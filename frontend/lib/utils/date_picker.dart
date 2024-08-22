import "package:flutter/material.dart";

class DatePicker extends StatefulWidget {
  const DatePicker(
      {required this.controller,
      required this.lastDate,
      required this.firstDate,
      this.label,
      this.size,
      Key? key})
      : super(key: key);
  final String? label;
  final String? size;
  final TextEditingController controller;
  final DateTime firstDate;
  final DateTime lastDate;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20), // Make the border rounded
      borderSide: const BorderSide(color: Colors.white));

  late TextEditingController _controller;
  late DateTime pickedDate;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    pickedDate = DateTime.now();
    _controller.text = _formatDate(pickedDate);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> handleTap(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: pickedDate,
      firstDate: widget.firstDate,
      lastDate: widget.lastDate,
    );

    if (selectedDate != null) {
      setState(() {
        pickedDate = selectedDate;
        _controller.text = _formatDate(selectedDate);
      });
    }
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month}-${date.day}';
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(
          labelText: widget.label != null ? widget.label : 'date',
          border: border,
          enabledBorder: border,
          focusedBorder: border),
      onTap: () {
        handleTap(context);
      },
      controller: _controller,
    );
  }
}
