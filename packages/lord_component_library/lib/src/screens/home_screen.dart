import 'package:flutter_svg/flutter_svg.dart';
import 'package:lord_component_library/component_library.dart';
import 'package:lord_ui/lord_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as dev;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const String svg =
      'packages/lord_component_library/lib/src/assets/homescreen.svgg';

  var _isInit = true;
  @override
  void didChangeDependencies() async {
    if (_isInit) {
      dev.log('fetchAndSetCards');

      await Provider.of<CardProvider>(context, listen: false)
          .fetchAndSetCards();
      dev.log('fetchAndSetCards');
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lotr Card Game'),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context).pushNamed('/deckBuilder'),
              icon: const Icon(Icons.add))
        ],
      ),
      body: Stack(
        children: [SvgPicture.asset(svg)],
      ),
    );
  }
}
