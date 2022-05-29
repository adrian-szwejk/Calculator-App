import 'package:flutter/material.dart';

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
      themeMode: ThemeMode.dark, //Preset themes used to color/design app
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
      ),
    );
  }
}
