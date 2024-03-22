import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lord_bloc/lord_bloc.dart';
import 'package:lord_component_library/component_library.dart';
import 'package:lord_repository/lord_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final rtdbCardRepository = FirebaseCardRepository();

    return MultiBlocProvider(
      providers: [
        BlocProvider<CardsBloc>(
            create: ((BuildContext context) =>
                CardsBloc(cardRepository: rtdbCardRepository)))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const OverviewEditScreenBloc(),
          '/editScreen': (context) => const EditScreen(),
          '/overview': (context) => const OverviewEditScreenBloc(),
        },
      ),
    );
  }
}
