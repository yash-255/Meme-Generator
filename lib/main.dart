import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meme_generator/Theme/theme.dart';
import 'package:meme_generator/constants/routes.dart';
import 'package:meme_generator/screens/home_screen.dart';
import 'package:meme_generator/screens/main_app_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meme Generator App',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const HomeScreen(),
      routes: {
        Routes.generateMeme: (context) => MainAppScreen(
              arguments: ModalRoute.of(context)!.settings.arguments
                  as MainAppScreenArguments,
            )
      },
    );
  }
}
