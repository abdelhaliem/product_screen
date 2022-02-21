import 'package:calculator/product_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
       // fontFamily: "Schyler",
        primarySwatch: Colors.blue,
      ),
      home:  const ProductScreen(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String output = "0";
  String _output = "0";
  String operand = "";
  double num1 = 0;
  double num2 = 0;

  PressedButton(String val) {
    if (val == "C") {
      output = "0";
      _output = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
    } else if (val == "+" || val == "-" || val == "X" || val == "/" || val == "%") {
      num1 = double.parse(output);
      operand = val;
      _output = "0";
      output = output + val;
    } else if (val == ".") {
      if (_output.contains(".")) {
        return;
      } else {
        _output = _output + val;
      }
    }else if(val == "="){
      num2 = double.parse(output);
      if(operand=="+"){
        _output = (num1 + num2).toString();
      }

      if(operand=="-"){
        _output = (num1 - num2).toString();
      }

      if(operand=="X"){
        _output = (num1 * num2).toString();
      }
      if(operand=="/"){
        _output = (num1 / num2).toString();
      }
      if(operand=="%"){
        _output = (num1 % num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
    }else{
      _output = _output + val ;
    }
    setState(() {
      output = double.parse(_output).toString();
      // output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget calButton(String buttonVal) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey[300],
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              offset: const Offset(2.0, 2.0),
              blurRadius: 8.0,
              spreadRadius: 1.0,
            ),
            const BoxShadow(
              color: Colors.white,
              offset: Offset(-2.0, -2.0),
              blurRadius: 8.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: MaterialButton(
          onPressed: () => PressedButton(buttonVal),
          padding: const EdgeInsets.all(25),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(
            buttonVal,
            style:  const TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 50),
              child: Text(
                output,
                style: const TextStyle(
                  fontSize: 60,
                ),
              ),
            ),
            const Expanded(
              child: Divider(),
            ),
            Column(
              children: [
                Row(
                  children: [
                    calButton('.'),
                    calButton('C'),
                    calButton('%'),
                    calButton('X'),
                  ],
                ),
                Row(
                  children: [
                    calButton('8'),
                    calButton('8'),
                    calButton('9'),
                    calButton('/'),
                  ],
                ),
                Row(
                  children: [
                    calButton('4'),
                    calButton('5'),
                    calButton('6'),
                    calButton('+'),
                  ],
                ),
                Row(
                  children: [
                    calButton('1'),
                    calButton('2'),
                    calButton('3'),
                    calButton('-'),
                  ],
                ),
                Row(
                  children: [
                    calButton('0'),
                    calButton('='),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
