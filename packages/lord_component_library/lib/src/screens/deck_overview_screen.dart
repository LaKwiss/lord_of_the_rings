import 'package:flutter/material.dart';

class DeckOverviewScreen extends StatefulWidget {
  const DeckOverviewScreen({super.key});

  static const routeName = '/deckOverviewScreen';

  @override
  State<DeckOverviewScreen> createState() => _DeckOverviewScreenState();
}

class _DeckOverviewScreenState extends State<DeckOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deck Overview'),
      ),
      body: const Center(
        child: Text('Deck Overview'),
      ),
    );
  }
}
