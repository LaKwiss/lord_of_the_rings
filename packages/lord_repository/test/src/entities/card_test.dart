import 'package:lord_repository/lord_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Card- fromModel -', () {
    const json = <String, dynamic>{
      "1": {
        "pack_code": "Core",
        "pack_name": "Core Set",
        "type_code": "hero",
        "type_name": "Hero",
        "sphere_code": "leadership",
        "sphere_name": "Leadership",
        "position": 1,
        "code": "01001",
        "name": "Aragorn",
        "traits": "D\u00fanedain. Noble. Ranger.",
        "text":
            "Sentinel.\n<b>Response:</b> After Aragorn commits to a quest, spend 1 resource from his resource pool to ready him.",
        "flavor":
            "\"I am Aragorn son of Arathorn; and if by life or death I can save you, I will.\"\n<cite>The Fellowship of the Ring</cite>",
        "is_unique": true,
        "threat": 12,
        "willpower": 2,
        "attack": 3,
        "defense": 2,
        "health": 5,
        "cost": "4",
        "quantity": 1,
        "deck_limit": 1,
        "illustrator": "John Stanko",
        "octgnid": "51223bd0-ffd1-11df-a976-0801200c9001",
        "has_errata": false,
        "url": "https://ringsdb.com/card/01001",
        "imagesrc": "https://ringsdb.com/bundles/cards/01001.png"
      },
    };

    const expectedCard = Card(
      pack_code: 'Core',
      pack_name: 'Core Set',
      type_code: 'hero',
      type_name: 'Hero',
      sphere_code: 'leadership',
      sphere_name: 'Leadership',
      position: 1,
      code: '01001',
      name: 'Aragorn',
      traits: 'D\u00fanedain. Noble. Ranger.',
      text:
          'Sentinel.\n<b>Response:</b> After Aragorn commits to a quest, spend 1 resource from his resource pool to ready him.',
      flavor:
          "\"I am Aragorn son of Arathorn; and if by life or death I can save you, I will.\"\n<cite>The Fellowship of the Ring</cite>",
      is_unique: true,
      threat: 12,
      willpower: 2,
      attack: 3,
      defense: 2,
      health: 5,
      cost: '4',
      quantity: 1,
      deck_limit: 1,
      illustrator: 'John Stanko',
      octgnid: '51223bd0-ffd1-11df-a976-0801200c9001',
      has_errata: false,
      url: 'https://ringsdb.com/card/01001',
      imagesrc: 'https://ringsdb.com/bundles/cards/01001.png',
      id: '1',
    );

    test('creates a Card object with correct values', () {
      final card = Card.fromModel(
        CardModel.fromJson(json['1']).copyWith(id: '1'),
      );

      expect(card, isA<Card>());
      expect(card, expectedCard);
    });
  });

  group('Card - toModel -', () {
    const card = Card(
        pack_code: 'Core',
        pack_name: 'Core Set',
        type_code: 'hero',
        type_name: 'Hero',
        sphere_code: 'leadership',
        sphere_name: 'Leadership',
        position: 1,
        code: '01001',
        name: 'Aragorn',
        traits: 'D\u00fanedain. Noble. Ranger.',
        text:
            'Sentinel.\n<b>Response:</b> After Aragorn commits to a quest, spend 1 resource from his resource pool to ready him.',
        flavor:
            "\"I am Aragorn son of Arathorn; and if by life or death I can save you, I will.\"\n<cite>The Fellowship of the Ring</cite>",
        is_unique: true,
        threat: 12,
        willpower: 2,
        attack: 3,
        defense: 2,
        health: 5,
        quantity: 1,
        deck_limit: 1,
        illustrator: 'John Stanko',
        octgnid: '51223bd0-ffd1-11df-a976-0801200c9001',
        has_errata: false,
        url: 'https://ringsdb.com/card/01001',
        imagesrc: 'https://ringsdb.com/bundles/cards/01001.png',
        id: '1');

    const expectedModel = CardModel(
        pack_code: 'Core',
        pack_name: 'Core Set',
        type_code: 'hero',
        type_name: 'Hero',
        sphere_code: 'leadership',
        sphere_name: 'Leadership',
        position: 1,
        code: '01001',
        name: 'Aragorn',
        traits: 'D\u00fanedain. Noble. Ranger.',
        text:
            'Sentinel.\n<b>Response:</b> After Aragorn commits to a quest, spend 1 resource from his resource pool to ready him.',
        flavor:
            "\"I am Aragorn son of Arathorn; and if by life or death I can save you, I will.\"\n<cite>The Fellowship of the Ring</cite>",
        is_unique: true,
        threat: 12,
        willpower: 2,
        attack: 3,
        defense: 2,
        health: 5,
        quantity: 1,
        deck_limit: 1,
        illustrator: 'John Stanko',
        octgnid: '51223bd0-ffd1-11df-a976-0801200c9001',
        has_errata: false,
        url: 'https://ringsdb.com/card/01001',
        imagesrc: 'https://ringsdb.com/bundles/cards/01001.png',
        id: '1');

    test('create a CardModel object with correct values', () {
      final model = card.toModel();
      expect(model, isA<CardModel>());
      expect(model, expectedModel);
    });
  });
}
