import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/pages/login_page.dart';
import 'package:flutter_ecommerce/pages/register_page.dart';
import 'package:flutter_ecommerce/shared/routes_names.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.cyan[400],
        accentColor: Colors.deepOrange[200],
        brightness:  Brightness.dark,
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          body1: TextStyle(fontSize: 18.0, ),
        )
      ),
      home: RegisterPage(),

      routes: {
       LoginRoute: (BuildContext context ) => LoginPage(),
        RegisterRoute: (BuildContext context) => RegisterPage(),
      },
    );
  }
}

