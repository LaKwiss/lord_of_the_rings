// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

import '../models/models.dart';

class Card extends Equatable {
  const Card(
      {this.pack_code,
      this.pack_name,
      this.type_code,
      this.type_name,
      this.sphere_code,
      this.sphere_name,
      this.position,
      this.code,
      this.name,
      this.traits,
      this.text,
      this.flavor,
      this.is_unique,
      this.threat,
      this.willpower,
      this.attack,
      this.defense,
      this.health,
      this.cost,
      this.quantity,
      this.deck_limit,
      this.illustrator,
      this.octgnid,
      this.has_errata,
      this.url,
      this.imagesrc,
      this.id});

  factory Card.fromModel(CardModel model) {
    return Card(
        pack_code: model.pack_code,
        pack_name: model.pack_name,
        type_code: model.type_code,
        type_name: model.type_name,
        sphere_code: model.sphere_code,
        sphere_name: model.sphere_name,
        position: model.position,
        code: model.code,
        name: model.name,
        traits: model.traits,
        text: model.text,
        flavor: model.flavor,
        is_unique: model.is_unique,
        threat: model.threat,
        willpower: model.willpower,
        attack: model.attack,
        defense: model.defense,
        health: model.health,
        cost: model.cost,
        quantity: model.quantity,
        deck_limit: model.deck_limit,
        illustrator: model.illustrator,
        octgnid: model.octgnid,
        has_errata: model.has_errata,
        url: model.url,
        imagesrc: model.imagesrc,
        id: model.id);
  }

  final String? pack_code;
  final String? pack_name;
  final String? type_code;
  final String? type_name;
  final String? sphere_code;
  final String? sphere_name;
  final int? position;
  final String? code;
  final String? name;
  final String? traits;
  final String? text;
  final String? flavor;
  final bool? is_unique;
  final int? threat;
  final int? willpower;
  final int? attack;
  final int? defense;
  final int? health;
  final String? cost;
  final int? quantity;
  final int? deck_limit;
  final String? illustrator;
  final String? octgnid;
  final bool? has_errata;
  final String? url;
  final String? imagesrc;
  final String? id;

  static const empty = Card(
      pack_code: '',
      pack_name: '',
      type_code: '',
      type_name: '',
      sphere_code: '',
      sphere_name: '',
      position: 0,
      code: '',
      name: '',
      traits: '',
      text: '',
      flavor: '',
      is_unique: false,
      threat: 0,
      willpower: 0,
      attack: 0,
      defense: 0,
      health: 0,
      cost: '',
      quantity: 0,
      deck_limit: 0,
      illustrator: '',
      octgnid: '',
      has_errata: false,
      url: '',
      imagesrc: '',
      id: '');

  Card copyWith({
    String? pack_code,
    String? pack_name,
    String? type_code,
    String? type_name,
    String? sphere_code,
    String? sphere_name,
    int? position,
    String? code,
    String? name,
    String? traits,
    String? text,
    String? flavor,
    bool? is_unique,
    int? threat,
    int? willpower,
    int? attack,
    int? defense,
    int? health,
    String? cost,
    int? quantity,
    int? deck_limit,
    String? illustrator,
    String? octgnid,
    bool? has_errata,
    String? url,
    String? imagesrc,
    String? id,
  }) {
    return Card(
        pack_code: pack_code ?? this.pack_code,
        pack_name: pack_name ?? this.pack_name,
        type_code: type_code ?? this.type_code,
        type_name: type_name ?? this.type_name,
        sphere_code: sphere_code ?? this.sphere_code,
        sphere_name: sphere_name ?? this.sphere_name,
        position: position ?? this.position,
        code: code ?? this.code,
        name: name ?? this.name,
        traits: traits ?? this.traits,
        text: text ?? this.text,
        flavor: flavor ?? this.flavor,
        is_unique: is_unique ?? this.is_unique,
        threat: threat ?? this.threat,
        willpower: willpower ?? this.willpower,
        attack: attack ?? this.attack,
        defense: defense ?? this.defense,
        health: health ?? this.health,
        cost: cost ?? this.cost,
        quantity: quantity ?? this.quantity,
        deck_limit: deck_limit ?? this.deck_limit,
        illustrator: illustrator ?? this.illustrator,
        octgnid: octgnid ?? this.octgnid,
        has_errata: has_errata ?? this.has_errata,
        url: url ?? this.url,
        imagesrc: imagesrc ?? this.imagesrc,
        id: id ?? this.id);
  }

  CardModel toModel() {
    return CardModel(
        pack_code: pack_code,
        pack_name: pack_name,
        type_code: type_code,
        type_name: type_name,
        sphere_code: sphere_code,
        sphere_name: sphere_name,
        position: position,
        code: code,
        name: name,
        traits: traits,
        text: text,
        flavor: flavor,
        is_unique: is_unique,
        threat: threat,
        willpower: willpower,
        attack: attack,
        defense: defense,
        health: health,
        cost: cost,
        quantity: quantity,
        deck_limit: deck_limit,
        illustrator: illustrator,
        octgnid: octgnid,
        has_errata: has_errata,
        url: url,
        imagesrc: imagesrc,
        id: id);
  }

  @override
  List<Object?> get props => [
        pack_code,
        pack_name,
        type_code,
        type_name,
        sphere_code,
        sphere_name,
        position,
        code,
        name,
        traits,
        text,
        flavor,
        is_unique,
        threat,
        willpower,
        attack,
        defense,
        health,
        cost,
        quantity,
        deck_limit,
        illustrator,
        octgnid,
        has_errata,
        url,
        imagesrc,
        id
      ];
}
