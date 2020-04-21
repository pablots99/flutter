import 'package:flutter/material.dart';
import 'package:styles/src/pages/basico_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseño',
      initialRoute: 'basico',
      routes: {
        'basico' :(BuildContext context)=> BasicoPage(),
      },
    );
  }
}