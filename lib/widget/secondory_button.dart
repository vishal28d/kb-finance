//flutter
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String? text;
  final VoidCallback? voidCallback;
  const SecondaryButton({Key? key, this.text, this.voidCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.only(left: 15, right: 15),
      width: MediaQuery.of(context).size.width,
      child: TextButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Theme.of(context).primaryColor.withOpacity(0.1)),
            shadowColor: WidgetStateProperty.all(Colors.white),
            foregroundColor: WidgetStateProperty.all(Theme.of(context).primaryColor),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            )),
            textStyle: WidgetStateProperty.all(TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ),
          onPressed: voidCallback,
          child: Text('$text')),
    );
  }
}
