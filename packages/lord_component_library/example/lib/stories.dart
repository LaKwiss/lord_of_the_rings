import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:lord_component_library/component_library.dart';
import 'dart:developer' as dev;

List<Story> getStories() {
  final a = CalcLine();

  int counter = 0;

  return [
    Story(name: 'Lord of the rings line', builder: (context) => a),
    Story(
        name: 'Lord of the rings add player',
        builder: (context) => AddPlayer(
            addFunction: () => dev.log('a'),
            removeFunction: () => dev.log('b'),
            counter: counter)),
    Story(name: 'Calc Screen', builder: (context) => Calculator()),
    Story(name: 'Create Deck', builder: (context) => const CreateDeck()),
  ];
}
