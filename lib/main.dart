import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/cubit/midoplan_cubit.dart';
import 'presentations/screens/midoplan_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;
  void toggleDarkMode() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MidoplanCubit(),
      child: MaterialApp(
        title: 'MI DO PLAN',
        //theme: isDarkMode ? ThemeData.dark(useMaterial3: true,) : ThemeData.light(useMaterial3: true,),
        theme: isDarkMode ? ThemeData.dark(useMaterial3: true,) : ThemeData.light(useMaterial3: true,),
        debugShowCheckedModeBanner: false,
        //theme: ThemeData(
          //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          //useMaterial3: true,
        //),
        home: MidoPlanScreen(
          isDarkMode: isDarkMode,
          toggleDarkMode: toggleDarkMode,
        ),
      ),
    );
  }
}
