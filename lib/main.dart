import 'package:flutter/material.dart';
import 'package:schoolapp/Pages/editdetails.dart';
import 'Pages/home.dart';
import 'Pages/shortdetail.dart';
import 'Pages/fullldetail.dart';
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
      title: 'Flutter Demo',
      initialRoute: '/shortDetails',
      routes: {
        '/': (context) => Home(),
        '/shortDetails': (context) => ShortDetail(),
        '/fullDetails': (context) => Fulldetail(),
        '/editDetails': (context) => EditDetails(),
      },
    );
  }
}

