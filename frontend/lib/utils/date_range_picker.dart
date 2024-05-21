import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateRangePicker extends StatefulWidget {
  const DateRangePicker({super.key, this.restorationId});
  final String? restorationId;

  @override
  State<DateRangePicker> createState() => _DateRangePickerState();
}

class _DateRangePickerState extends State<DateRangePicker>
    with RestorationMixin {
  @override
  String? get restorationId => widget.restorationId;
  final RestorableDateTimeN _startDate = RestorableDateTimeN(DateTime(2021));
  final RestorableDateTimeN _endDate =
      RestorableDateTimeN(DateTime(2021, 1, 5));
  late final RestorableRouteFuture<DateTimeRange?>
      _restorableDateRangePickerRouteFuture =
      RestorableRouteFuture<DateTimeRange?>(
    onComplete: _selectDateRange,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator
          .restorablePush(_dateRangePickerRoute, arguments: <String, dynamic>{
        'initialStartDate': _startDate.value?.millisecondsSinceEpoch,
        'initialEndDate': _endDate.value?.millisecondsSinceEpoch,
      });
    },
  );

  void _selectDateRange(DateTimeRange? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _startDate.value = newSelectedDate.start;
        _endDate.value = newSelectedDate.end;
      });
    }
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_startDate, 'start_date');
    registerForRestoration(_endDate, 'end_date');
    registerForRestoration(
        _restorableDateRangePickerRouteFuture, 'date_picker_route_future');
  }

  @pragma('vm:entry-point')
  static Route<DateTimeRange?> _dateRangePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTimeRange?>(
      context: context,
      builder: (BuildContext context) {
        return DateRangePickerDialog(
          restorationId: 'date_picker_dialog',
          initialDateRange:
              _initialDateTimeRange(arguments! as Map<dynamic, dynamic>),
          firstDate: DateTime(2021),
          currentDate: DateTime(2021, 1, 25),
          lastDate: DateTime(2022),
        );
      },
    );
  }

  static DateTimeRange? _initialDateTimeRange(Map<dynamic, dynamic> arguments) {
    if (arguments['initialStartDate'] != null &&
        arguments['initialEndDate'] != null) {
      return DateTimeRange(
        start: DateTime.fromMillisecondsSinceEpoch(
            arguments['initialStartDate'] as int),
        end: DateTime.fromMillisecondsSinceEpoch(
            arguments['initialEndDate'] as int),
      );
    }

    return null;
  }

  
@override
Widget build(BuildContext context) {
  return OutlinedButton(
    onPressed: () {
      _restorableDateRangePickerRouteFuture.present();
    },
    style: ButtonStyle(
      // Add some padding to the button
      padding: MaterialStateProperty.all<EdgeInsets>(
        EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      ),
      // Add a border radius to the button
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      // Add hover and focus effects
      overlayColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.hovered))
            return Theme.of(context).colorScheme.primary.withOpacity(0.1);
          if (states.contains(MaterialState.focused) ||
              states.contains(MaterialState.pressed))
            return Theme.of(context).colorScheme.primary.withOpacity(0.2);
          return null; // Defer to the default value for other states and colors
        },
      ),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min, // Ensure the row takes minimum space
      children: [
        Icon(
          Icons.date_range, // Add an icon for better visual indication
          color: Theme.of(context).colorScheme.primary, // Match icon color with theme
        ),
        SizedBox(width: 8), // Add spacing between icon and text
        Text(
          _startDate.value != null
              ? DateFormat.yMMMd().format(_startDate.value!)
              : 'Start Date',
          style: TextStyle(
            fontWeight: FontWeight.bold, // Emphasize the text
          ),
        ),
        SizedBox(width: 8), // Add spacing between start and end date texts
        Text(
          _endDate.value != null
              ? DateFormat.yMMMd().format(_endDate.value!)
              : 'End Date',
          style: TextStyle(
            fontWeight: FontWeight.bold, // Emphasize the text
          ),
        ),
      ],
    ),
  );
}
}
