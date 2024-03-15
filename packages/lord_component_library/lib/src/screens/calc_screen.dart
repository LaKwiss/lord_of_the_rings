// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:lord_component_library/component_library.dart';
import 'package:lord_repository/lord_repository.dart';
import 'package:lord_ui/lord_ui.dart';
import 'package:provider/provider.dart';

class Calculator extends StatefulWidget {
  Calculator({super.key});

  static const routeName = '/calculator';

  @override
  State<Calculator> createState() => _CalculatorState();

  List<CalcLine> calcLines = [];
}

class _CalculatorState extends State<Calculator> {
  int subTotal = 0;

  @override
  void initState() {
    super.initState();

    widget.calcLines.add(CalcLine());

    subTotal = widget.calcLines[0].result;
  }

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<DeckProvider>(context).decks;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculateur de score'),
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/'),
              icon: const Icon(Icons.home_filled)),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Row(
        children: [
          Expanded(
            flex: 5,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      children: [
                        const Text(
                          'Nombre de joueur :',
                          style: TextStyle(fontSize: 18),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12),
                          child: Text(
                            widget.calcLines.length.toString(),
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                        AddPlayer(
                            addFunction: () {
                              setState(() {
                                widget.calcLines.add(CalcLine());
                              });
                            },
                            removeFunction: () {
                              setState(() {
                                if (widget.calcLines.length > 1) {
                                  widget.calcLines.removeLast();
                                }
                              });
                            },
                            counter: widget.calcLines.length),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Wrap(
                      direction: Axis.vertical,
                      spacing: 8.0,
                      children: [...widget.calcLines],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 418, top: 2),
                  child: FinalLine(calcLines: widget.calcLines),
                ),
              ],
            ),
          ),
          Expanded(
              flex: 4,
              child: DeckChooserDropDown(
                list: list,
              )),
        ],
      ),
    );
  }
}

class DeckChooserDropDown extends StatefulWidget {
  const DeckChooserDropDown({required this.list, super.key});

  final List<Deck> list;

  @override
  State<DeckChooserDropDown> createState() => _DeckChooserDropDownState();
}

class _DeckChooserDropDownState extends State<DeckChooserDropDown> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = widget.list[0].name;
    return Consumer<DeckProvider>(
      builder: (context, deckProvider, child) {
        return Center(
          child: DropdownMenu<String>(
            initialSelection: dropdownValue,
            onSelected: (String? value) {
              setState(() {
                dropdownValue = value!;
              });
            },
            dropdownMenuEntries: widget.list.map((value) {
              return DropdownMenuEntry<String>(
                  value: value.name, label: value.name);
            }).toList(),
          ),
        );
      },
    );
  }
}
