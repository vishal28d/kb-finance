import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

  DateTime? newDate ;
class DatePickerField extends StatelessWidget {
  final DateTime? date ; // Immutable date field
  final String labelText; // Label for the date field
  final ValueChanged<DateTime?> onChanged; // Callback to notify parent of changes

  const DatePickerField({
    Key? key,
    required this.date,
    required this.labelText,
    required this.onChanged,
  }) : super(key: key);


  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: date ?? DateTime.now(), // Set initial date
      firstDate: DateTime(1900), // Minimum selectable date
      lastDate: DateTime(2100), // Maximum selectable date
    );

    if (pickedDate != null && pickedDate != date) {
      onChanged(pickedDate); // Notify parent with the selected date
      newDate = pickedDate ;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        InkWell(
          onTap: () => _selectDate(context), // Open date picker on tap
          child: Container(
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey), // Border styling
              borderRadius: BorderRadius.circular(8), // Rounded corners
            ),
            child: Text(
              newDate != null
                  ? DateFormat('dd/MM/yyyy').format(newDate!) // Format the selected date
                  : 'Select Date',
              style: TextStyle(
                color: date != null ? Colors.black : Colors.grey, // Change color based on selection
              ),
            ),
          ),
        ),
      ],
    );
  }
}
