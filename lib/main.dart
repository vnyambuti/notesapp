import 'package:flutter/material.dart';
import 'package:notes/Themes/theme_provider.dart';
import 'package:notes/models/notes_database.dart';
import 'package:notes/pages/notes_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotesDatabase().initialize();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NotesDatabase(),
        ),
        ChangeNotifierProvider(
          create: (context) => THemeProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NotesPage(),
        theme: Provider.of<THemeProvider>(context).themedata);
  }
}
