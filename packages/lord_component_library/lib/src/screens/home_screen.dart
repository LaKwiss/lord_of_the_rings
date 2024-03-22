import 'package:lord_component_library/component_library.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();

  static const routeName = '/';
}

class _HomeScreenState extends State<HomeScreen> {
  static const String svg =
      'packages/lord_component_library/lib/src/assets/homescreen.png';

  var _isInit = true;
  @override
  void didChangeDependencies() async {
    if (_isInit) {
      // await Provider.of<CardProvider>(context, listen: false)
      //     .fetchAndSetCards();
      // await Provider.of<DeckProvider>(context, listen: false)
      //     .fetchAndSetDecks();
      // await Provider.of<ScenarioProvider>(context, listen: false)
      //     .fetchAndSetScenarios();
      // BlocProvider.of<CardsBloc>(context).add(FetchAndSetCards());
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(OverviewScenariosScreen.routeName);
        },
        child: const Icon(Icons.add),
      ),
      backgroundColor: Color(0xFFD1B590),
      body: Stack(
        children: [
          Center(
            child: Image.asset(svg /* SVG not working ==> flutter_svg.dart*/),
          ),
          Positioned(
            top: 285,
            right: 785,
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
            bottom: 245,
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
            top: 410,
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
