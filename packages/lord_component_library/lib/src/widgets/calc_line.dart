// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:lord_component_library/component_library.dart';

class CalcLine extends StatefulWidget {
  CalcLine({super.key});

  int result = 0;

  @override
  State<CalcLine> createState() => _CalcLineState();
}

class _CalcLineState extends State<CalcLine> {
  final _yellowController = TextEditingController();

  final _blueController = TextEditingController();

  final _redController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _yellowController.dispose();
    _blueController.dispose();
    _redController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ScoringTextFormField(
              Controller: _redController,
              function: finalCalculation,
              type: FieldType.red),
        ),
        LotrSymbol(SymbolType.plus),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ScoringTextFormField(
              Controller: _yellowController,
              function: finalCalculation,
              type: FieldType.yellow),
        ),
        LotrSymbol(SymbolType.plus),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: ScoringTextFormField(
              Controller: _blueController,
              function: finalCalculation,
              type: FieldType.blue),
        ),
        GestureDetector(
            onTap: finalCalculation, child: LotrSymbol(SymbolType.equals)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Blank(value: widget.result),
        ),
      ],
    );
  }

  void finalCalculation() {
    int a = 0;
    int b = 0;
    int c = 0;

    try {
      if (a == 0 && _redController.text.isNotEmpty) {
        a += int.parse(_redController.text);
      }
      if (b == 0 && _blueController.text.isNotEmpty) {
        b += int.parse(_blueController.text);
      }
      if (c == 0 && _yellowController.text.isNotEmpty) {
        c += int.parse(_yellowController.text);
      }

      setState(() {
        widget.result = a + b + c;
      });
    } catch (e) {
      print('Error: $e');
      throw Exception('Error: $e');
    }
  }
}
