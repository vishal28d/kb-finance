//flutter
import 'package:flutter/material.dart';

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double? height;
  final double? appbarPadding;
  final Widget? title;
  final bool? centerTitle;
  final Widget? leading;
  final List<Widget>? actions;

  const MyCustomAppBar({Key? key, this.leading, this.title, this.centerTitle, this.actions, @required this.height, this.appbarPadding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          child: Padding(
            padding: EdgeInsets.only(top: appbarPadding!, bottom: appbarPadding!),
            child: AppBar(title: title, centerTitle: centerTitle, leading: leading, actions: actions),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height!);
}
