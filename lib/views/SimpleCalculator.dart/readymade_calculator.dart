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
      calculateResult(); // Calculate when "=" is pressed
    } else if (buttonText == "+/-") {
      toggleSign();
    } else {
      input.value += buttonText;
      autoCalculate(); // Automatically calculate after any input
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
    autoCalculate(); // Recalculate after deletion
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
    autoCalculate(); // Recalculate after toggling sign
  }

  // Calculate the result of the expression
 void calculateResult() {
  try {
    // Replace 'x' with '*', but retain '%' in the input and handle it during calculation
    String userInput = input.value.replaceAll('x', '*');

    // Handle percentages in the form of `x%y` as `(x/100)*y` and `x%` as `(x/100)`
    userInput = userInput.replaceAllMapped(
      RegExp(r'(\d+(\.\d+)?)%(\d+(\.\d+)?)?'),
      (match) {
        String num1 = match.group(1)!;  // first number before %
        String? num2 = match.group(3);  // optional second number after %

        if (num2 != null) {
          // If the percentage is followed by another number (e.g., 4%2), convert it to (4/100) * 2
          return '($num1/100)*$num2';
        } else {
          // If it's just a percentage (e.g., 4%), convert it to (4/100)
          return '($num1/100)';
        }
      },
    );

    // Parse and evaluate the final expression
    Parser parser = Parser();
    Expression expression = parser.parse(userInput);
    ContextModel cm = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, cm);

    // Set the output value with the result rounded to 2 decimal places
    output.value = eval.toStringAsFixed(2);
  } catch (e) {
    // Handle any error during the evaluation process
    output.value = "Error";
  }
}


  // Automatically calculate result after any input change
  void autoCalculate() {
    if (input.isNotEmpty && !isOperator(input.value[input.value.length - 1])) {
      calculateResult();
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end, // Align the calculator to the bottom
                children: <Widget>[
                  // Display Input and Output using Obx (Reactive State Management)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                        Obx(() => FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                calculatorController.output.value,
                                style: style.copyWith(
                                    color: const Color(0xff000000),
                                    fontSize: 45,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      ],
                    ),
                  ),

                  // Grid for calculator buttons
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30),
                    child: GridView.builder(
                        shrinkWrap: true, // Adjust the size based on children
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: calculatorController.calButtonsList.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4, childAspectRatio: 1.2),
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
            ),
          );
        },
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
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Container(
          height: 45,
          width: 45,
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
