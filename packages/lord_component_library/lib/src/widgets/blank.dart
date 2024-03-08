import 'package:flutter/material.dart';

class Blank extends StatelessWidget {
  const Blank({super.key, required this.value});

  final int value;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      width: 54,
      child: Container(
        color: Color(0xFFF9E8C9),
        child: Center(
            child: Text(
          value.toString(),
          style: TextStyle(fontSize: 24),
        )),
      ),
    );
  }
}
