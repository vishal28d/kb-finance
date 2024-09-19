import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerField extends StatelessWidget {
  final DateTime? date;
  final String labelText;
  final ValueChanged<DateTime?> onChanged;

  const DatePickerField({
    Key? key,
    required this.date,
    required this.labelText,
    required this.onChanged,
  }) : super(key: key);

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: date ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != date) {
      onChanged(pickedDate);
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
          onTap: () => _selectDate(context),
          child: Container(
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              date != null
                  ? DateFormat('dd/MM/yyyy').format(date!)
                  : 'Select Date',
              style: TextStyle(
                color: date != null ? Colors.black : Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
