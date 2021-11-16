import 'package:empty_app/parking_deatil.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'emP:ty App',
      theme: ThemeData(
          //primarySwatch: purple //Colors.blue,
          primaryColor: Color(0xFF613EEA),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Color(0xFF16FC72),
          ),
          textTheme: TextTheme(
              headline1: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              bodyText1:
                  TextStyle(fontSize: 16, fontWeight: FontWeight.normal))),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ParkingDetail();
  }
}
