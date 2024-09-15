import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

// Calculator Controller using GetX for state management
class CalculatorController extends GetxController {
  var input = "".obs;   // Observable variable for input
  var output = "0".obs; // Observable variable for output

  final List<String> calButtonsList = [
    'AC',
    '+/-',
    '%',
    'DEL',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];

  // Method to handle button presses
  void onButtonPressed(String buttonText) {
    if (buttonText == "AC") {
      clear();
    } else if (buttonText == "DEL") {
      delete();
    } else if (buttonText == "=") {
      calculateResult();
    } else if (buttonText == "+/-") {
      toggleSign();
    } else {
      input.value += buttonText;
    }
  }

  // Clear the calculator
  void clear() {
    input.value = '';
    output.value = '0';
  }

  // Delete the last character
  void delete() {
    if (input.isNotEmpty) {
      input.value = input.value.substring(0, input.value.length - 1);
    }
  }

  // Toggle between positive and negative values
  void toggleSign() {
    if (input.isNotEmpty && input.value.contains(RegExp(r'^[0-9.]+$'))) {
      if (input.value.startsWith('-')) {
        input.value = input.value.replaceFirst('-', '');
      } else {
        input.value = '-' + input.value;
      }
    }
  }

  // Calculate the result of the expression
  void calculateResult() {
    try {
      Parser parser = Parser();
      Expression expression = parser.parse(input.value.replaceAll('x', '*'));
      ContextModel cm = ContextModel();
      double eval = expression.evaluate(EvaluationType.REAL, cm);
      output.value = eval.toString();
    } catch (e) {
      output.value = "Error";
    }
  }

  bool isOperator(String x) {
    return (x == '/' || x == 'x' || x == '-' || x == '+');
  }
}

// ReadyMadeCalculator UI using GetX
class ReadyMadeCalculator extends StatelessWidget {
  ReadyMadeCalculator({Key? key}) : super(key: key);

  // Initialize the controller
  final CalculatorController calculatorController = Get.put(CalculatorController());

  @override
  Widget build(BuildContext context) {
    var style = const TextStyle(
        fontSize: 28,
        fontFamily: 'Dosis',
        color: Color(0xffffffff),
        fontWeight: FontWeight.normal);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Simple Calculator'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end, // Align the calculator to the bottom
        children: <Widget>[
          // Display Input and Output using Obx (Reactive State Management)
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Obx(() => Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                        calculatorController.input.value,
                        style: style.copyWith(
                            color: const Color(0xff000000), fontSize: 30),
                      ),
                )),
                Obx(() => Text(
                      calculatorController.output.value ,
                      style: style.copyWith(
                          color: const Color(0xff000000),
                          fontSize: 48,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),

          // Grid for calculator buttons
          Expanded(
            flex: 2,
            child: GridView.builder(
                itemCount: calculatorController.calButtonsList.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  String buttonText = calculatorController.calButtonsList[index];

                  return CalButton(
                    onTapped: () {
                      calculatorController.onButtonPressed(buttonText);
                    },
                    value: buttonText,
                    color: calculatorController.isOperator(buttonText)
                        ? const Color(0xff104E8B)
                        : Colors.grey[200],
                    btnTextStyle: style.copyWith(
                      color: calculatorController.isOperator(buttonText)
                          ? const Color(0xffffffff)
                          : const Color(0xff000000),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

// Buttons widget
class CalButton extends StatelessWidget {
  final Color? color;
  final String? value;
  final TextStyle? btnTextStyle;
  final VoidCallback? onTapped;

  const CalButton(
      {Key? key,
      required this.color,
      required this.value,
      required this.btnTextStyle,
      this.onTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapped!,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(60)),
            color: color,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: Text(
              value!,
              textAlign: TextAlign.center,
              style: btnTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
