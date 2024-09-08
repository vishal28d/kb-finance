//flutter
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:credit_app/controllers/imageController.dart';

class ImageWidget extends StatelessWidget {
  final File? file;
  final String? name;

  const ImageWidget({Key? key, @required this.file, @required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImageControlller>(builder: (controller) {
      return GetBuilder<ImageControlller>(builder: (controller) {
        return Container(
          decoration: BoxDecoration(
            image: file != null ? DecorationImage(image: FileImage(file!), fit: BoxFit.contain) : null,
          ),
          child: file == null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: Text(
                          'Tap to upload $name',
                          style: TextStyle(color: Color(0xFF8A959E), fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Icon(
                          Icons.add,
                          color: Theme.of(context).primaryColor,
                          size: 60,
                        ),
                      )
                    ],
                  ),
                )
              : SizedBox(),
        );
      });
    });
  }
}
