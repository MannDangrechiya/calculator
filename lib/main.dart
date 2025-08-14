import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _output = '0';
  String _expression = '';
  double num1 = 0;
  double num2 = 0;
  String operand = '';

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _output = '0';
        _expression = '';
        num1 = 0;
        num2 = 0;
        operand = '';
      } else if (buttonText == '+' || buttonText == '-' || buttonText == '×' || buttonText == '÷') {
        num1 = double.parse(_output);
        operand = buttonText;
        _expression = '$num1 $operand';
        _output = '0';
      } else if (buttonText == '=') {
        num2 = double.parse(_output);
        if (operand == '+') {
          _output = (num1 + num2).toString();
        } else if (operand == '-') {
          _output = (num1 - num2).toString();
        } else if (operand == '×') {
          _output = (num1 * num2).toString();
        } else if (operand == '÷') {
          _output = num2 != 0 ? (num1 / num2).toString() : 'Error';
        }
        _expression = '';
      } else {
        _output = _output == '0' ? buttonText : _output + buttonText;
      }
    });
  }

  Widget buildButton(String text, {Color color = Colors.black}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ElevatedButton(
          onPressed: () => buttonPressed(text),
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: const EdgeInsets.all(22),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 24, color: Colors.green),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculator')),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _expression,
                    style: const TextStyle(fontSize: 22, color: Colors.grey),
                  ),
                  Text(
                    _output,
                    style: const TextStyle(
                        fontSize: 48, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          //  const Divider(),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Row(
                  children: [
                    buildButton('C', color: Colors.greenAccent),
                    buildButton('=')
                  ],
                ),
                Row(
                  children: [
                    buildButton('7'),
                    buildButton('8'),
                    buildButton('9'),
                    buildButton('+', color: Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildButton('4'),
                    buildButton('5'),
                    buildButton('6'),
                    buildButton('-', color: Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildButton('1'),
                    buildButton('2'),
                    buildButton('3'),
                    buildButton('×', color: Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: Container()),
                    buildButton('0',),
                    Expanded(child: Container()),
                    buildButton('÷', color: Colors.orange),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

