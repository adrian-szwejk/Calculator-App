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
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(10.0),
            //Container is a class that combines design widgets to make it more convenient (Basically a container is like a box to store contents)
            child: const Text(
              //child in this context means that you can only have one widget in this container
              "0",
              style: TextStyle(fontSize: 30.0),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(10.0),
            child: const Text(
              //child in this context means that you can only have one widget in this container
              "0",
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.grey,
              ),
            ),
          ),
          const Expanded(
            //Expanded widgets give the widget inside of it as much space as it can occupy
            child: Divider(),
          ),
          Table(
            //Used to create cells with buttons in each in the shape of a table
            children: <TableRow>[
              TableRow(
                //Table requires a list of Tablerows(which are like the rows of cells of the table)
                children: <Widget>[
                  TextButton(
                    //Creating a button for the clear button
                    onPressed: () {},
                    child: const Text(
                      "C",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
