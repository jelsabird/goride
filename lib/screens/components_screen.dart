import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:goride/widgets/close_button.dart';

class ComponentsScreen extends StatelessWidget {
  const ComponentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildGradientBackGround(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: Text('Components')),
        body: Column(
          children: [
            Text('Close button'),
            XButton(),
            Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [color1, color2],
                  stops: [0, 1],
                  center: Alignment.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildGradientBackGround({Widget? child}) {
    return Container(
      decoration: BoxDecoration(),
      child: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
              colors: [color1, Colors.white],
              stops: [0, 1],
              center: Alignment.center,
              radius: 0.88,
              transform: GradientRotation(87)),
        ),
        child: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [color1, Colors.white],
                stops: [0, 1],
                center: Alignment.center,
                radius: 0.88,
              ),
            ),
            child: child),
      ),
    );
  }
}

Color color1 = Color.fromARGB(1, 160, 214, 197);

Color color2 = Color.fromARGB(1, 163, 239, 255);

Color color3 = Color.fromARGB(1, 179, 251, 247);

Color color4 = Color.fromARGB(1, 163, 242, 177);

Color color5 = Color.fromARGB(1, 160, 214, 197);

// center
// angle degrees 100 (1.74532925 radians)
// opacity 0.6

Color color10 = Color.fromARGB(76, 171, 245, 251);

Color color11 = Colors.white;
