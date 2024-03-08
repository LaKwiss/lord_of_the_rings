import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum FieldType {
  red('packages/lord_component_library/lib/src/assets/red.png'),
  blue('packages/lord_component_library/lib/src/assets/blue.png'),
  yellow('packages/lord_component_library/lib/src/assets/yellow.png');

  const FieldType(this.url);

  final String url;
}

class ScoringTextFormField extends StatefulWidget {
  ScoringTextFormField(
      {super.key,
      required this.Controller,
      required this.function,
      required this.type});

  final Controller;
  final VoidCallback function;
  final FieldType type;

  @override
  State<ScoringTextFormField> createState() => _ScoringTextFormFieldState();
}

class _ScoringTextFormFieldState extends State<ScoringTextFormField> {
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
    if (widget.type.runtimeType == FieldType) {
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
                  color: Color(0xFFF9E8C9),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    maxLength: 2,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: widget.Controller,
                    focusNode: _textFocusNode,
                    decoration: InputDecoration(
                        counter: SizedBox(
                      width: 0,
                      height: 0,
                    )),
                  ),
                )
              : Container(
                  color: Color(0xFFF9E8C9),
                  child: Image.asset(widget.type.url.toString()),
                ),
        ),
      );
    } else {
      throw ('Widget Type error : No such Type');
    }
  }
}
