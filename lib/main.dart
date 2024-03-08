import 'package:flutter/material.dart';
import 'package:lord_component_library/component_library.dart';
import 'package:lord_repository/lord_repository.dart';
import 'package:lord_ui/lord_ui.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => CardProvider((FirebaseCardRepository()))),
        ChangeNotifierProvider(
            create: (_) => DeckProvider(FirebaseDeckRepository())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const HomeScreen(),
          DeckBuilder.routeName: (context) => DeckBuilder(),
          Calculator.routeName: (context) => Calculator(),
          DeckNameChooserScreen.routeName: (context) => DeckNameChooserScreen(),
          OverviewEditScreen.routeName: (context) => const OverviewEditScreen(),
          EditScreen.routeName: (context) => const EditScreen(),
          AddScreen.routeName: (context) => const AddScreen(),

        },
      ),
    );
  }
}
