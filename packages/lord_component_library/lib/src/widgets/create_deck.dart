import 'package:flutter/material.dart';

class CreateDeck extends StatefulWidget {
  const CreateDeck({super.key});

  @override
  State<CreateDeck> createState() => _CreateDeckState();
}

class _CreateDeckState extends State<CreateDeck> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      width: 500,
      color: Colors.lightBlue,
      child: Center(
        child: IconButton(
          icon: Icon(
            Icons.add_circle_outline_rounded,
            color: Colors.white,
            size: 50,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
