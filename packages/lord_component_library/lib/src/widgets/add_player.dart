import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddPlayer extends StatefulWidget {
  AddPlayer(
      {super.key,
      required this.addFunction,
      required this.removeFunction,
      required this.counter});

  int counter;

  VoidCallback addFunction;
  VoidCallback removeFunction;

  @override
  State<AddPlayer> createState() => _AddPlayerState();
}

class _AddPlayerState extends State<AddPlayer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      height: 38,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (widget.counter == 4) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          title: Text('You can\'t have more than 4 player.'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Center(child: Text('OK')))
                          ],
                        ));
              } else {
                setState(() {
                  widget.counter++;
                  widget.addFunction();
                });
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFF9E8C9),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      bottomLeft: Radius.circular(60))),
              child: Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Center(
                  child: Image.asset(
                      'packages/lord_component_library/lib/src/assets/plus.png'),
                ),
              ),
            ),
          ),
          Container(width: 5, color: Color(0xFFF9E8C9)),
          GestureDetector(
            onTap: () {
              if (widget.counter == 1) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          title: Text('You must have at least one player.'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Center(child: Text('OK')))
                          ],
                        ));
              } else {
                setState(() {
                  widget.counter--;
                  widget.removeFunction();
                });
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFF9E8C9),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                  )),
              child: Padding(
                padding: const EdgeInsets.only(right: 3),
                child: Center(
                  child: Image.asset(
                      'packages/lord_component_library/lib/src/assets/minus.png'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
