//flutter
import 'package:flutter/material.dart';

//input textformfiled
class CustomTextFormField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String? hintText;
  final bool? obscureText;
  final TextInputType? textInputType;
  final Widget? prefixIcon;
  final Widget? sufixIcon;
  final int? maxLength;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final FocusNode? focusnode;
  final bool? readOnly;
  final void Function()? onTap;

  const CustomTextFormField({Key? key, this.focusnode, this.onTap, this.readOnly, this.prefixIcon, this.onEditingComplete, this.sufixIcon, this.maxLength, this.onChanged, this.textEditingController, @required this.hintText, this.obscureText, this.textInputType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      readOnly: readOnly != null ? readOnly! : false,
      maxLength: maxLength,
      focusNode: focusnode,
      cursorColor: Colors.black,
      obscureText: obscureText != null ? obscureText! : false,
      controller: textEditingController,
      keyboardType: textInputType,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: sufixIcon,
      ),
    );
  }
}
