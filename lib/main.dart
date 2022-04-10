import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Resto',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.grey[90],
            primaryColor: Colors.deepOrangeAccent,
            primarySwatch: Colors.deepOrange
        ),
        home: HomeScreen(),
    );
  }
}
