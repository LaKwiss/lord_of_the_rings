import 'package:lord_component_library/component_library.dart';
import 'package:lord_ui/lord_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as dev;
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                onPressed: () =>
                    Navigator.of(context).pushNamed('/deckBuilder'),
                icon: const Icon(Icons.add))
          ],
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, Calculator.routeName),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(75),
                  child: Container(
                    color: Colors.lightBlue,
                    height: 175,
                    width: 450,
                    child: Center(
                      child: Text('Calculateur',
                          style: TextStyle(color: Colors.white, fontSize: 70)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, OverviewEditScreen.routeName),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(75),
                  child: Container(
                    color: Colors.lightBlue,
                    height: 175,
                    width: 500,
                    child: Center(
                      child: Text(
                        'Deck Creator',
                        style: TextStyle(color: Colors.white, fontSize: 70),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              ClipRRect(
                borderRadius: BorderRadius.circular(75),
                child: Container(
                  color: Colors.lightBlue,
                  height: 175,
                  width: 300,
                  child: Center(
                    child: Text(
                      'Cards',
                      style: GoogleFonts.inter(
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 70)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
