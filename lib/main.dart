import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lord_bloc/lord_bloc.dart';
import 'package:lord_component_library/component_library.dart';
import 'package:lord_repository/lord_repository.dart';
//import 'package:lord_repository/lord_repository.dart';
//import 'package:lord_bloc/lord_bloc.dart';
//import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(
    //         create: (_) => CardProvider((FirebaseCardRepository()))),
    //     ChangeNotifierProvider(
    //         create: (_) => DeckProvider(FirebaseDeckRepository())),
    //     ChangeNotifierProvider(
    //         create: (_) => ScenarioProvider(FirebaseScenarioRepository())),
    //   ],
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     routes: {
    //       DeckBuilder.routeName: (context) => DeckBuilder(),
    //       Calculator.routeName: (context) => Calculator(),
    //       DeckNameChooserScreen.routeName: (context) => DeckNameChooserScreen(),
    //       OverviewEditScreen.routeName: (context) => const OverviewEditScreen(),
    //       EditScreen.routeName: (context) => const EditScreen(),
    //       AddScreen.routeName: (context) => const AddScreen(),
    //       OverviewScenariosScreen.routeName: (context) =>
    //           const OverviewScenariosScreen(),
    //       '/': (context) => const HomeScreen(),
    //       DeckOverviewScreen.routeName: (context) => const DeckOverviewScreen(),
    //     },
    //   ),
    // );
    final rtdbCardRepository = FirebaseCardRepository();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          create: (context) => CardsBloc(cardRepository: rtdbCardRepository)
            ..add(FetchAndSetCards()),
          child: const OverviewEditScreenBloc(),
        ));
  }
}
