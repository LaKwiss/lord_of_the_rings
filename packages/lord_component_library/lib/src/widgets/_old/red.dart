import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Red extends StatefulWidget {
  Red({super.key, required this.Controller, required this.function});

  final Controller;

  final VoidCallback function;

  @override
  State<Red> createState() => _RedState();
}

class _RedState extends State<Red> {
  bool _isClicked = false;
  final _textFocusNode = FocusNode();

  @override
  void initState() {
    _textFocusNode.addListener(updateScore);
    super.initState();
  }

  void updateScore() {
    if (!_textFocusNode.hasFocus) {
      widget.function();
    }
  }

  @override
  void dispose() {
    _textFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      width: 54,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isClicked = !_isClicked;
          });
        },
        child: _isClicked
            ? Container(
                child: TextFormField(
                  textAlign: TextAlign.center,
                  maxLength: 2,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: widget.Controller,
                  focusNode: _textFocusNode,
                ),
              )
            : Container(
                color: Color(0xFFF9E8C9),
                child: Image.asset(
                    'packages/lord_component_library/lib/src/assets/Red.png'),
              ),
      ),
    );
  }
}
