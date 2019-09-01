import 'package:flutter/material.dart';
import 'region_code.dart';
import 'dart:ui';


void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: Image.asset(
              'assets/bgr.jpeg',
              fit: BoxFit.fitHeight,
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              color: Colors.transparent,
            ),
          ),
          RegionCode()
        ],
      ),
    );
  }
}