import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lord_bloc/lord_bloc.dart';

class TestBlocCardScreen extends StatelessWidget {
  TestBlocCardScreen({super.key});

  final List<Card> cards = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Bloc Card'),
      ),
      body: Center(
        child: BlocBuilder<CardsBloc, CardsState>(
          builder: (context, state) {
            return Text(state.cards.length.toString());
          },
        ),
      ),
    );
  }
}
