import 'package:flutter/material.dart';
import 'package:journal_app/pallete.dart';
import 'title_bar.dart';
import 'sidebar.dart';
import 'text_input.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Pallete.darkerBlack,
      body: Column(
        children: [
          TitleBar(),
          Expanded(
            child: Row(
              children: [
                Sidebar(),
                TextInput()
              ],
            ),
          )
        ]
      )
    );
  }
}