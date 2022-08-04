//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //constant MarterialApp b/c nothing is changing in the design/home location
      home: const CalcView(), //the home location of the app
      theme: ThemeData
          .dark(), //Cant be constant so I had to remove const from in from of "MaterialApp" and only place it in front of parts that needed it
      themeMode: ThemeMode
          .dark, //Preset themes used to color/design app | Also is not constant because app is always changing and adding dark themed parts
      debugShowCheckedModeBanner:
          false, //Removes red debug banner in the top right of the app
    );
  }
}

class CalcView extends StatefulWidget {
  const CalcView({Key? key}) : super(key: key);

  @override
  State<CalcView> createState() => _CalcViewState();
}

class _CalcViewState extends State<CalcView> {
  //Strings to keep track of values that are changing
  String input = "";
  String output = "";
  String equation = "";
  //Function to update values on top right after pressing buttosn
  void calculation(String text) {
    //The param = uni-code(buttton) that the user clicks on
    setState(() {
      //Changing the state of values and displays them
      switch (text) {
        case "C":
          //Clear button
          input = "0";
          output = "";
          equation = "";
          break;

        case "\u232b":
          //Backspace button
          if (output.isNotEmpty) {
            input = "0";
            output = "";
            equation = "";
          } else {
            //Deleting last char in string
            input = input.substring(0, input.length - 1);
            if (input == "") {
              //If we delete too much
              input = "0";
            }
          }
          break;

        case "\u003D":
          //Equals button
          equation = input;
          //Created this to use in package to compute math but not display ugly symbols
          equation = equation.replaceAll("\u00F7", "/");
          equation = equation.replaceAll("\u00D7", "*");
          try {
            //Parser, Expression, and ContextModel from Math_expression package that allows us to parse math equation
            Parser p = Parser();
            Expression exp = p.parse(equation);
            ContextModel cm = ContextModel();
            //evaluation type is real numbers that are set to a context model that keeps track of functions and variables
            output = "${exp.evaluate(EvaluationType.REAL, cm)}";
            //Setting output to string with variables(evaluation of equation from earlier) inside of it
          } catch (e) {
            output = "Error";
          }
          break;

        case "\u00F7":
        //Divison Button
        case "\u00D7":
        //Multiplication Button
        case "+":
        //Addition button
        case "-":
        //Subtraction button
        case "^":
          //Power button
          if (output.isNotEmpty) {
            input = output + text;
          } else {
            input += text;
          }
          //Appends or sets text to input
          break;

        default:
          if (output.isNotEmpty) {
            //Checking if we are able to parse the last char of string
            if (int.tryParse(input[input.length - 1]) == null) {
              //This tells us that there is some kind of operation happening
              input += text;
              output = "";
            } else {
              //If there is no operation you can set the value to the text
              input = text;
              output = "";
            }
          } else if (input == "0") {
            //If the input is empty
            input = text;
          } else {
            input += text;
          }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Usually within a material app(like the one above) it comes with a scaffold to help structure it from top to bottom
      appBar: AppBar(
        //Top part of the scaffold where the appBar/Title are
        title: const Text(
          //Title can have text, style, TextAlign, etc. |  Also has to be constant because it is a text that doesn't change
          "Calculator",
          style: TextStyle(
            //Standard TextStyle where you can change fontsize, color, weight, etc.
            fontSize: 35.0,
          ),
        ),
        centerTitle: true,
        shadowColor: const Color.fromARGB(255, 157, 0, 255),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
            //Container is a class that combines design widgets to make it more convenient (Basically a container is like a box to store contents)
            child: Text(
              //child in this context means that you can only have one widget in this container
              input,
              style: const TextStyle(fontSize: 50.0),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(10.0),
            child: Text(
              //child in this context means that you can only have one widget in this container
              output,
              style: const TextStyle(
                fontSize: 50.0,
                color: Colors.grey,
              ),
            ),
          ),
          const Expanded(
            //Expanded widgets give the widget inside of it as much space as it can occupy
            child:
                Divider(), //Divider used to create a line that divides the different parts of the table and the containers above
          ),
          Table(
            //Used to create cells with buttons in each in the shape of a table
            children: <TableRow>[
              TableRow(
                //Table requires a list of Tablerows(which are like the rows of cells of the table)
                children: <Widget>[
                  buildButton(
                    name: "C",
                    color: Colors.red,
                    fontColor: Colors.white,
                    fontSize: 30.0,
                  ),
                  buildButton(
                    name: "\u232b",
                    color: Colors.grey[800],
                    fontColor: Colors.red,
                    fontSize: 30.0,
                  ),
                  buildButton(
                    name: "^",
                    color: Colors.grey[800],
                    fontColor: Colors.green,
                    fontSize: 30.0,
                  ),
                  buildButton(
                    name: "\u00F7",
                    color: Colors.grey[800],
                    fontColor: Colors.green,
                    fontSize: 30.0,
                  ),
                ],
              ),
              TableRow(
                //Table requires a list of Tablerows(which are like the rows of cells of the table)
                children: <Widget>[
                  buildButton(
                    name: "7",
                    color: Colors.grey[800],
                    fontColor: Colors.white,
                    fontSize: 30.0,
                  ),
                  buildButton(
                    name: "8",
                    color: Colors.grey[800],
                    fontColor: Colors.white,
                    fontSize: 30.0,
                  ),
                  buildButton(
                    name: "9",
                    color: Colors.grey[800],
                    fontColor: Colors.white,
                    fontSize: 30.0,
                  ),
                  buildButton(
                    name: "x",
                    color: Colors.grey[800],
                    fontColor: Colors.green,
                    fontSize: 30.0,
                  ),
                ],
              ),
              TableRow(
                //Table requires a list of Tablerows(which are like the rows of cells of the table)
                children: <Widget>[
                  buildButton(
                    name: "4",
                    color: Colors.grey[800],
                    fontColor: Colors.white,
                    fontSize: 30.0,
                  ),
                  buildButton(
                    name: "5",
                    color: Colors.grey[800],
                    fontColor: Colors.white,
                    fontSize: 30.0,
                  ),
                  buildButton(
                    name: "6",
                    color: Colors.grey[800],
                    fontColor: Colors.white,
                    fontSize: 30.0,
                  ),
                  buildButton(
                    name: "-",
                    color: Colors.grey[800],
                    fontColor: Colors.green,
                    fontSize: 30.0,
                  ),
                ],
              ),
              TableRow(
                //Table requires a list of Tablerows(which are like the rows of cells of the table)
                children: <Widget>[
                  buildButton(
                    name: "1",
                    color: Colors.grey[800],
                    fontColor: Colors.white,
                    fontSize: 30.0,
                  ),
                  buildButton(
                    name: "2",
                    color: Colors.grey[800],
                    fontColor: Colors.white,
                    fontSize: 30.0,
                  ),
                  buildButton(
                    name: "3",
                    color: Colors.grey[800],
                    fontColor: Colors.white,
                    fontSize: 30.0,
                  ),
                  buildButton(
                    name: "+",
                    color: Colors.grey[800],
                    fontColor: Colors.green,
                    fontSize: 30.0,
                  ),
                ],
              ),
              TableRow(
                //Table requires a list of Tablerows(which are like the rows of cells of the table)
                children: <Widget>[
                  buildButton(
                    name: "+/-",
                    color: Colors.grey[800],
                    fontColor: Colors.white,
                    fontSize: 30.0,
                  ),
                  buildButton(
                    name: "0",
                    color: Colors.grey[800],
                    fontColor: Colors.white,
                    fontSize: 30.0,
                  ),
                  buildButton(
                    name: ".",
                    color: Colors.grey[800],
                    fontColor: Colors.white,
                    fontSize: 30.0,
                  ),
                  buildButton(
                    name: "=",
                    color: Colors.green,
                    fontColor: Colors.white,
                    fontSize: 30.0,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container buildButton(
      //This function was extracted to prevent repetitive code when creating table of buttons
      {String name = "",
      Color fontColor = Colors.green,
      double fontSize = 30.0,
      Color? color}) {
    //The brackets allow each parameter to not be required and so that you can pass whichever one you want (There needs to be default values since they're not required as a parameter)
    return Container(
      //Wrapped original testButton with container to allow for padding between buttons
      padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
      child: TextButton(
        //Creating a button for the clear button
        onPressed: () {},
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(const Size.fromHeight(50)),
          //Sets fixed size for all buttons instead of dif size for carrot and divide
          backgroundColor: MaterialStateProperty.all(color),
          padding: //Padding for "C" button but requires MSP b/c it's buttonStyle
              MaterialStateProperty.all(const EdgeInsets.all(5.0)),
          shape: MaterialStateProperty.all(
            //Shape of the cells of the table
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  12.0), //Makes the end of the border curved
            ),
          ),
        ),
        child: Text(
          name,
          style: TextStyle(
            color: fontColor,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
