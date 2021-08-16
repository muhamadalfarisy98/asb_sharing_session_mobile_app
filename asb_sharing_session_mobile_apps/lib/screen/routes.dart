import 'package:flutter/material.dart';
import 'StartingScreen.dart';
import 'GetDataProduct.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // jika ingin mengirim argument
    // final args = settings.arguments; 
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => StartingScreen());
      case '/data':
        return MaterialPageRoute(builder: (_) => GetDataProduct());
      default:
        return _errorRoute();
    }
  }
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: Text("Error")),
        body: Center(child: Text('Error page')),
      );
    });
  }
}