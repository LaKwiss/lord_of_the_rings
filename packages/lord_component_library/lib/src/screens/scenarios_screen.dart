import 'package:flutter/material.dart' hide Card;
import 'package:lord_bloc/lord_bloc.dart';
import 'package:provider/provider.dart';

class OverviewScenariosScreen extends StatefulWidget {
  const OverviewScenariosScreen({Key? key});

  static const routeName = '/ScenariosOverview';
  @override
  State<OverviewScenariosScreen> createState() => _OverviewScenariosScreen();
}

class _OverviewScenariosScreen extends State<OverviewScenariosScreen> {
  @override
  Widget build(BuildContext context) {
    final scenarioProvider = Provider.of<ScenarioProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Overview Edit Screen'),
        actions: [
          IconButton(
            onPressed: () {
              throw UnimplementedError();
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: scenarioProvider.scenarios.length,
        separatorBuilder: (context, index) => SizedBox(height: 2),
        itemBuilder: (context, index) {
          final scenario = scenarioProvider.scenarios[index];
          return Container(
            color: index % 2 == 0 ? Colors.grey[200] : null,
            child: ListTile(
              title: Text(scenario.name),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconTheme(
                    data: IconThemeData(color: Colors.white),
                    child: IconButton(
                      icon: Icon(Icons.edit),
                      color: Colors.green,
                      onPressed: () {
                        throw UnimplementedError();
                      },
                    ),
                  ),
                  IconTheme(
                    data: IconThemeData(color: Colors.white),
                    child: IconButton(
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Delete Scenario ?'),
                              content: Text(
                                  'Are you sure you want to delete the scenario "${scenario}"?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    throw UnimplementedError();
                                  },
                                  child: Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    throw UnimplementedError();
                                  },
                                  child: Text('Delete'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
