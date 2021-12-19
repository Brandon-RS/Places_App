import 'package:flutter/material.dart';
import 'package:places_app/src/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Places App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
      ),
      initialRoute: HomeScreen.routeName,
      routes: getAplicationRoutes(),
    );
  }
}
