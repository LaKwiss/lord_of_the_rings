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
      'packages/lord_component_library/lib/src/assets/homescreen.png';

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
      backgroundColor: Color(0xFFD1B590),
      appBar: AppBar(
        title: const Text('Lotr Card Game'),
      ),
      body: Stack(
        children: [
          Center(
            child: Image.asset(svg /* SVG not working ==> flutter_svg.dart*/),
          ),
          Positioned(
            top: 220,
            right: 800,
            child: Tooltip(
              message: 'Calculator',
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(Calculator.routeName);
                },
                child: Container(
                  height: 50,
                  width: 50,
                  color: Color(0xFFf7daab),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 220,
            left: 840,
            child: Tooltip(
              message: 'Cards List',
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(OverviewEditScreen.routeName);
                },
                child:
                    Container(height: 50, width: 50, color: Color(0xffac928a)),
              ),
            ),
          ),
          Positioned(
            top: 350,
            right: 895,
            child: Tooltip(
              message: 'Create Deck',
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(DeckNameChooserScreen.routeName);
                },
                child: Container(
                  height: 50,
                  width: 50,
                  color: Color(0xff83e8b9),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
