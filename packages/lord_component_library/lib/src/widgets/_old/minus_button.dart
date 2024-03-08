import 'package:flutter/material.dart';

class MinusButton extends StatelessWidget {
  const MinusButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 58,
        width: 54,
        child: Image.asset(
            'packages/lord_component_library/lib/src/assets/minus.png'));
  }
}
