// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lord_component_library/component_library.dart';
// ignore: unused_import
import 'dart:developer' as dev;

class FinalLine extends StatefulWidget {
  FinalLine({required this.calcLines, super.key});

  @override
  State<FinalLine> createState() => _FinalLineState();

  int result = 0;
  List<CalcLine> calcLines;
  int? previous;
}

class _FinalLineState extends State<FinalLine> {
  final victoryPoints = TextEditingController();
  final tourNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.topLeft, child: LotrSymbol(SymbolType.minus)),
        Row(
          children: [
            FinalScoringTextFormField(
                Controller: victoryPoints,
                function: () => endCalculation(widget.calcLines)),
            SizedBox(width: 5),
            Text('Nombre de points de victoire',
                style: TextStyle(fontSize: 18.0)),
          ],
        ),
        Align(alignment: Alignment.topLeft, child: LotrSymbol(SymbolType.plus)),
        Row(
          children: [
            FinalScoringTextFormField(
                Controller: tourNumber,
                function: () => endCalculation(widget.calcLines)),
            SizedBox(width: 5),
            Text(
              'Nombre de tours',
              style: TextStyle(fontSize: 18.0),
            )
          ],
        ),
        Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
                onTap: () => endCalculation(widget.calcLines),
                child: Tooltip(
                    message: 'Calculate',
                    child: LotrSymbol(SymbolType.equals)))),
        Row(
          children: [
            Blank(
                value: widget.result == 0 ||
                        widget.calcLines.length != widget.previous
                    ? endCalculation(widget.calcLines)
                    : widget.result),
            SizedBox(width: 5),
            Text(
              'Score Final',
              style: TextStyle(fontSize: 18.0),
            )
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    victoryPoints.dispose();
    tourNumber.dispose();
    super.dispose();
  }

  int endCalculation(List<CalcLine> calcLines) {
    widget.previous = widget.calcLines.length;

    int a = 0;
    int b = 0;

    try {
      if (a == 0 && victoryPoints.text.isNotEmpty) {
        a -= int.parse(victoryPoints.text);
      }
      if (b == 0 && tourNumber.text.isNotEmpty) {
        b += int.parse(tourNumber.text);
      }

      List<CalcLine> calcLines = widget.calcLines;
      int subTotal = 0;

      for (var i = 0; i < calcLines.length; i++) {
        subTotal += calcLines[i].result;
      }

      setState(() {
        widget.result = (subTotal + a) + (b * 10);
      });

      return widget.result;
    } catch (e) {
      print('Error: $e');
      throw Exception('Error: $e');
    }
  }
}

class FinalScoringTextFormField extends StatefulWidget {
  FinalScoringTextFormField(
      {super.key, required this.Controller, required this.function});

  final Controller;
  final VoidCallback function;

  @override
  State<FinalScoringTextFormField> createState() =>
      _FinalScoringTextFormFieldState();
}

class _FinalScoringTextFormFieldState extends State<FinalScoringTextFormField> {
  final _FocusNode = FocusNode();

  @override
  void initState() {
    _FocusNode.addListener(updateScore);
    super.initState();
  }

  void updateScore() {
    if (!_FocusNode.hasFocus) {
      widget.function();
    }
  }

  @override
  void dispose() {
    _FocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      width: 54,
      child: Container(
        color: Color(0xFFF9E8C9),
        child: TextFormField(
          textAlign: TextAlign.center,
          maxLength: 2,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          controller: widget.Controller,
          focusNode: _FocusNode,
          decoration: InputDecoration(
              counter: SizedBox(
            width: 0,
            height: 0,
          )),
        ),
      ),
    );
  }
}
