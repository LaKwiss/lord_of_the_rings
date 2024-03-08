// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class CardModel extends Equatable {
  const CardModel(
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

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      pack_code: json['pack_code'] ?? '',
      pack_name: json['pack_name'] ?? '',
      type_code: json['type_code'] ?? '',
      type_name: json['type_name'] ?? '',
      sphere_code: json['sphere_code'] ?? '',
      sphere_name: json['sphere_name'] ?? '',
      position: json['position'] ?? 0,
      code: json['code'] ?? '',
      name: json['name'] ?? '',
      traits: json['traits'] ?? '',
      text: json['text'] ?? '',
      flavor: json['flavor'] ?? '',
      is_unique: json['is_unique'] ?? false,
      threat: json['threat'] ?? 0,
      willpower: json['willpower'] ?? 0,
      attack: json['attack'] ?? 0,
      defense: json['defense'] ?? 0,
      health: json['health'] ?? 0,
      cost: json['cost'] ?? '',
      quantity: json['quantity'] ?? 0,
      deck_limit: json['deck_limit'] ?? 0,
      illustrator: json['illustrator'] ?? '',
      octgnid: json['octgnid'] ?? '',
      has_errata: json['has_errata'] ?? false,
      url: json['url'] ?? '',
      imagesrc: json['imagesrc'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pack_code': pack_code,
      'pack_name': pack_name,
      'type_code': type_code,
      'type_name': type_name,
      'sphere_code': sphere_code,
      'sphere_name': sphere_name,
      'position': position,
      'code': code,
      'name': name,
      'traits': traits,
      'text': text,
      'flavor': flavor,
      'is_unique': is_unique,
      'threat': threat,
      'willpower': willpower,
      'attack': attack,
      'defense': defense,
      'health': health,
      'cost': cost,
      'quantity': quantity,
      'deck_limit': deck_limit,
      'illustrator': illustrator,
      'octgnid': octgnid,
      'has_errata': has_errata,
      'url': url,
      'imagesrc': imagesrc,
    };
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
  final String? cost;
  final int? threat;
  final int? willpower;
  final int? attack;
  final int? defense;
  final int? health;
  final int? quantity;
  final int? deck_limit;
  final String? illustrator;
  final String? octgnid;
  final bool? has_errata;
  final String? url;
  final String? imagesrc;
  final String? id;

  CardModel copyWith({
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
    String? cost,
    int? threat,
    int? willpower,
    int? attack,
    int? defense,
    int? health,
    int? quantity,
    int? deck_limit,
    String? illustrator,
    String? octgnid,
    bool? has_errata,
    String? url,
    String? imagesrc,
    String? id,
  }) {
    return CardModel(
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
      quantity: quantity ?? this.quantity,
      deck_limit: deck_limit ?? this.deck_limit,
      illustrator: illustrator ?? this.illustrator,
      octgnid: octgnid ?? this.octgnid,
      has_errata: has_errata ?? this.has_errata,
      url: url ?? this.url,
      imagesrc: imagesrc ?? this.imagesrc,
      cost: cost ?? this.cost,
      id: id,
    );
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
        cost,
        threat,
        willpower,
        attack,
        defense,
        health,
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
