import 'package:flutter/material.dart';

class PlusButton extends StatelessWidget {
  const PlusButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 58,
        width: 54,
        child: Image.asset(
            'packages/lord_component_library/lib/src/assets/plus.png'));
  }
}
