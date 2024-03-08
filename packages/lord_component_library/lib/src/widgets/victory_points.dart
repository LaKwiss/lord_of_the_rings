import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class VictoryPoints extends StatefulWidget {
  VictoryPoints({super.key, required this.Controller, required this.function});

  final Controller;
  VoidCallback function;

  @override
  State<VictoryPoints> createState() => _VictoryPointsState();
}

class _VictoryPointsState extends State<VictoryPoints> {
  final _textFocusNode = FocusNode();

  void initState() {
    _textFocusNode.addListener(updateScore);
    super.initState();
  }

  void updateScore() {
    if (!_textFocusNode.hasFocus) {
      widget.function();
    }
  }

  void dispose() {
    _textFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      width: 54,
      child: Container(
        child: TextFormField(
          textAlign: TextAlign.center,
          maxLength: 2,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          controller: widget.Controller,
          focusNode: _textFocusNode,
        ),
      ),
    );
  }
}
