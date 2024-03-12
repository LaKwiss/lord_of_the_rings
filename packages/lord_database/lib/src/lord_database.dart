import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class LotrCardDatabase {
  final FirebaseDatabase dbLotrCardGame = FirebaseDatabase.instance;
  static const cardsNode = 'card';
  late DatabaseReference _LotrCardGameRef;
  static final instance = LotrCardDatabase._();
  LotrCardDatabase._() {
    _LotrCardGameRef = dbLotrCardGame.ref();
  }

  Future<void> prepareDatabase() async {
    final dataString = await rootBundle
        .loadString('packages/lord_database/lib/src/assets/data/card.json');
    final Map<String, dynamic> json = jsonDecode(dataString);
    final Map<String, Map> updates = {};
    if (json[cardsNode] != null) {
      _LotrCardGameRef.child(cardsNode).remove();
      json[cardsNode].forEach((v) {
        final idCard = _LotrCardGameRef.child(cardsNode).push().key;
        updates['$cardsNode/$idCard'] = v;
      });
      return _LotrCardGameRef.update(updates);
    }
  }

  Future<void> dumpDatabase() async {
    return _LotrCardGameRef.remove();
  }
}
