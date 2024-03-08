import 'package:flutter/material.dart';

enum SymbolType {
  plus('packages/lord_component_library/lib/src/assets/plus.png'),
  minus('packages/lord_component_library/lib/src/assets/minus.png'),
  equals('packages/lord_component_library/lib/src/assets/equals.png');

  const SymbolType(this.url);

  final String url;
}

class LotrSymbol extends StatelessWidget {
  const LotrSymbol(this.type, {super.key});

  final SymbolType type;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 58, width: 54, child: Image.asset(type.url));
  }
}
