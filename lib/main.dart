import 'package:flutter/material.dart';
import 'formfactor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form FactorDemo',
      home: Scaffold(
        appBar: AppBar(title: Text("form Factor Demo")),
        body: FormFactor(
          phoneScreenSize: 6.0,
          phone: Text("Running on a phone"),
          tablet: Text("Running on a tablet")
        ),
      ),
    );
  }
}

