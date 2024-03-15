// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class LotrCardItem extends StatefulWidget {
  LotrCardItem(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.onSelected});

  @override
  State<LotrCardItem> createState() => _LotrCardItemState();

  final imageUrl;
  final name;
  final Function onSelected;

  bool isSelectionned = false;
}

class _LotrCardItemState extends State<LotrCardItem> {
  @override
  void setState(VoidCallback fn) {
    widget.onSelected();

    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.name,
      child: SizedBox(
        height: 280,
        width: 200,
        child: Stack(children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.network(widget.imageUrl)),
          Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => setState(() {
                  widget.isSelectionned = !widget.isSelectionned;
                }),
                child: CircleAvatar(
                  backgroundColor: Colors.lightBlue,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              )),
        ]),
      ),
    );
  }
}
