import 'package:flutter/material.dart';

class XButton extends StatefulWidget {
  @override
  State<XButton> createState() => _XButtonState();
}

class _XButtonState extends State<XButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.only(bottom: 30),
        child: Container(
          height: 50,
          width: 50,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.5),
            border: Border.all(color: Colors.white, width: 1),
          ),
          child:
              Icon(Icons.close, color: Colors.black.withOpacity(0.4), size: 20),
        ),
      ),
    );
  }
}
