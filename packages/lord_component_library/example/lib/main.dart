import 'package:flutter/material.dart' hide Card;
import 'package:google_fonts/google_fonts.dart';
import 'package:lord_repository/lord_repository.dart';
import 'package:lord_bloc/lord_bloc.dart';
import 'package:provider/provider.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'stories.dart';

void main() {
  GoogleFonts.config.allowRuntimeFetching = false;
  runApp(const StorybookApp());
}

class StorybookApp extends StatelessWidget {
  const StorybookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => CardProvider(FirebaseCardRepository()))
      ],
      child: Storybook(
        stories: [...getStories()],
        initialStory: 'Lord Of The Rings/blue',
      ),
    );
  }
}
