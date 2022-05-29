import 'package:flutter/material.dart';

void main() {
  runApp(const CalcView());
}

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CalcView(),
      themeMode: ThemeMode.dark,
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
    return Container();
  }
}
