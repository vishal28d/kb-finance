//flutter
import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  final Widget? hint;
  final VoidCallback? voidCallback;
  final List<dynamic>? list;
  final void Function(dynamic)? onChanged;
  final dynamic type;
  final dynamic val;
  const CustomDropDown({Key? key, this.voidCallback, this.type, this.onChanged, this.hint, this.val, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      style: TextStyle(color: Colors.red),
      items: list!.map<DropdownMenuItem>((dynamic value) {
        return DropdownMenuItem<dynamic>(
          value: value,
          child: Text(
            value.toString(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        );
      }).toList(),
      value: val,
      hint: hint,
      onChanged: onChanged,
      isExpanded: true,
    );
  }
}
