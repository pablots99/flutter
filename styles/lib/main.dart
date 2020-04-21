import 'package:flutter/material.dart';
import 'package:styles/src/pages/basico_page.dart';
import 'package:styles/src/pages/botone_page.dart';
import 'package:styles/src/pages/scroll_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseño',
      initialRoute: 'botones',
      routes: {
        'basico' :(BuildContext context)=> BasicoPage(),
        'scroll' :(BuildContext context)=> Scrollpage(),
        'botones' :(BuildContext context)=> BotonesPage()
      },
    );
  }
}