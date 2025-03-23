import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CupertinoDatePickerField extends StatelessWidget {
  final DateTime? date;
  final String labelText;
  final ValueChanged<DateTime?> onChanged;

  const CupertinoDatePickerField({
    Key? key,
    required this.date,
    required this.labelText,
    required this.onChanged,
  }) : super(key: key);

  void _showCupertinoDatePicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 250,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  CupertinoButton(
                    child: Text('Done'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: CupertinoDatePicker(
                initialDateTime: date ?? DateTime.now(),
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (DateTime newDate) {
                  onChanged(newDate);
                },
              ),
            ),
          ],
        ),
      ),
    );
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
          onTap: () => _showCupertinoDatePicker(context),
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
