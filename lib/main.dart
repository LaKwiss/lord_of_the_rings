import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lord_bloc/lord_bloc.dart';
import 'package:lord_component_library/component_library.dart';
import 'package:go_router/go_router.dart';
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
    final router = GoRouter(
      routes: [
        GoRoute(
          name: 'home',
          path: '/',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          name: 'calculator',
          path: '/calculator',
          builder: (context, state) => Calculator(),
        ),
        GoRoute(
          name: 'overviewScenarios',
          path: '/overviewScenarios',
          builder: (context, state) => const OverviewScenariosScreen(),
        ),
        GoRoute(
            name: 'overviewEditScreenBloc',
            path: '/overviewEditScreenBloc',
            builder: (context, state) => const OverviewEditScreenBloc()),
      ],
    );

    final rtdbCardRepository = FirebaseCardRepository();

    return MultiBlocProvider(
        providers: [
          BlocProvider<CardsBloc>(
              create: ((BuildContext context) =>
                  CardsBloc(cardRepository: rtdbCardRepository)))
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        ));
  }
}
