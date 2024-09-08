//flutter
import 'package:flutter/material.dart';

class NetWorkErrorWidget extends StatelessWidget {
  const NetWorkErrorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/noInternet.jpg'))),
      ),
    );
  }
}
