import 'package:flutter/material.dart';
import 'presentacion/screens/pantalla.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora Flutter',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Pantalla(),
    );
  }
}