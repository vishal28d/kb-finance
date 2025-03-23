//flutter
import 'package:flutter/material.dart';

//input textformfiled
class LoaderWidget extends StatelessWidget {
  final String? loaderText;
  const LoaderWidget({
    Key? key,
    @required this.loaderText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
