import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorHomeScreen(),
    );
  }
}

class CalculatorHomeScreen extends StatefulWidget {
  @override
  _CalculatorHomeScreenState createState() => _CalculatorHomeScreenState();
}

class _CalculatorHomeScreenState extends State<CalculatorHomeScreen> {
  String _currentNumber = '';
  double _result = 0;

  get currentOperator => null;

  void _onNumberButtonPressed(String number) {
    setState(() {
      _currentNumber += number;
    });
  }

  void _onOperatorButtonPressed(String operator) {
    setState(() {
      if (_currentNumber.isNotEmpty) {
        _result = double.parse(_currentNumber);
        _currentNumber = '';
      }
    });
  }

  void _onEqualButtonPressed() {
    setState(() {
      if (_currentNumber.isNotEmpty) {
        double currentNumber = double.parse(_currentNumber);
        switch (currentOperator) {
          case '+':
            _result += currentNumber;
            break;
          case '-':
            _result -= currentNumber;
            break;
          case '*':
            _result *= currentNumber;
            break;
          case '/':
            _result /= currentNumber;
            break;
        }
        _currentNumber = '';
      }
    });
  }

  void _onClearButtonPressed() {
    setState(() {
      _currentNumber = '';
      _result = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.centerRight,
            child: Text(
              _currentNumber.isEmpty ? _result.toString() : _currentNumber,
              style: TextStyle(fontSize: 24.0),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              children: [
                _buildButton('7'),
                _buildButton('8'),
                _buildButton('9'),
                _buildButton('/'),
                _buildButton('4'),
                _buildButton('5'),
                _buildButton('6'),
                _buildButton('*'),
                _buildButton('1'),
                _buildButton('2'),
                _buildButton('3'),
                _buildButton('-'),
                _buildButton('0'),
                _buildButton('.'),
                _buildButton('='),
                _buildButton('+'),
              ],
            ),
          ),
          // RaisedButton(
          //   onPressed: _onClearButtonPressed,
          //   child: Text('Clear'),
          // ),
        ],
      ),
    );
  }

  Widget _buildButton(String text) {
    return ElevatedButton(
      onPressed: () {
        if (text == '=') {
          _onEqualButtonPressed();
        } else if (text == '+' || text == '-' || text == '*' || text == '/') {
          _onOperatorButtonPressed(text);
        } else {
          _onNumberButtonPressed(text);
        }
      },
      child: Text(
        text,
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}
