import 'package:flutter/material.dart';
import 'package:glint/glint.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Glint Example',
        home: Scaffold(
            body: Padding(
          padding: EdgeInsets.all(16),
          child: ListView(
            children: [
              Glint(
                isLoading: true,
                glintItem: GlintItem(
                  spacing: 5,
                  itemCount: 10,
                  direction: Axis.vertical,
                  height: 50,
                  radius: 4,
                ),
                child: Container(),
              )
            ],
          ),
        )));
  }
}
