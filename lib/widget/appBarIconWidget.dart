import 'package:flutter/material.dart';

class AppBarIcon extends StatelessWidget {
  final VoidCallback? voidCallback;
  final IconData? iconData;
  final int? iconColor;
  final double? rightPadding;
  final double? leftPadding;

  const AppBarIcon({
    Key? key,
    @required this.voidCallback,
    @required this.iconData,
    @required this.iconColor,
    @required this.rightPadding,
    @required this.leftPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: rightPadding!, left: leftPadding!),
      child: SizedBox(
        height: 35,
        width: 35,
        child: FloatingActionButton(
            heroTag: UniqueKey(),
            mini: true,
            elevation: 0.9,
            backgroundColor: Colors.white,
            onPressed: voidCallback,
            child: Center(
              child: Icon(
                iconData,
                color: Color(iconColor!),
              ),
            )),
      ),
    );
  }
}
