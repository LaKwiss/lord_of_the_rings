import 'package:lord_database/lord_database.dart';
import 'package:example/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PrepareDatabase',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: false,
      ),
      home: const PrepareDatabase(),
    );
  }
}

class PrepareDatabase extends StatefulWidget {
  const PrepareDatabase({super.key});
  @override
  State<PrepareDatabase> createState() => _PrepareDatabaseState();
}

class _PrepareDatabaseState extends State<PrepareDatabase> {
  var _isInit = true;
  var _isLoading = false;
  @override
  void didChangeDependencies() async {
    if (_isInit) {
      _isLoading = true;
      await LotrCardDatabase.instance.dumpDatabase();
      await LotrCardDatabase.instance.prepareDatabase();
      setState(() {
        _isLoading = false;
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : const Center(child: Text('Data loaded')),
    );
  }
}
