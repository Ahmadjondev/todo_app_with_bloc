import 'package:flutter/material.dart';
import 'package:todo_app/screens/recycler_bin.dart';
import 'package:todo_app/screens/tabs_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecyclerBin.id:
        return MaterialPageRoute(
          builder: (context) => const RecyclerBin(),
        );
      case TabsScreen.id:
        return MaterialPageRoute(
          builder: (context) => const TabsScreen(),
        );
      default:
        return null;
    }
  }
}
