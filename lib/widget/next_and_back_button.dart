//flutter
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NextBackButton extends StatelessWidget {
  final String? text;
  final VoidCallback? backFunction;
  final VoidCallback? nextFunction;

  const NextBackButton({Key? key, this.text, this.backFunction, this.nextFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.only(left: 15, right: 15),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          GestureDetector(
            onTap: backFunction,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(color: Color(0xFFF4F5F7), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), topLeft: Radius.circular(25))),
              child: Center(
                child: Icon(Icons.arrow_back_ios),
              ),
            ),
          ),
          GestureDetector(
            onTap: nextFunction,
            child: Container(
              margin: EdgeInsets.only(left: 15),
              width: Get.width - 95,
              height: 50,
              decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.only(bottomRight: Radius.circular(25), topRight: Radius.circular(25))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Next',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
