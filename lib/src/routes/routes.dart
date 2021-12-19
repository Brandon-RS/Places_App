import 'package:flutter/material.dart';

// Imports

import 'package:places_app/src/screens/home_screen.dart';

// Exports

export 'package:places_app/src/screens/home_screen.dart';

// Content

Map<String, WidgetBuilder> getAplicationRoutes() => <String, WidgetBuilder>{
      HomeScreen.routeName: (BuildContext context) => const HomeScreen(),
    };
