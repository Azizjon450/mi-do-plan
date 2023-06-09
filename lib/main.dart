import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'logic/blocs/active_midoplan/active_midoplans_bloc.dart';
import 'logic/blocs/completed/completed_midoplans_bloc.dart';
import 'logic/blocs/midoplan/midoplan_bloc.dart';
import 'logic/blocs/user/user_bloc.dart';

import 'presentations/screens/midoplan_details_screen.dart';
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
    return MultiBlocProvider(
      providers: [
        // BlocProvider(
        //   create: (ctx) => UserCubit(),
        // ),
        // BlocProvider(
        //   create: (ctx) => MidoplanCubit(userCubit: ctx.read<UserCubit>()),
        // ),
        // BlocProvider(
        //   create: (ctx) => ActiveMidoplansCubit(ctx.read<MidoplanCubit>()),
        // ),
        // BlocProvider(
        //   create: (ctx) => CompletedMidoplansCubit(ctx.read<MidoplanCubit>()),
        // ),
        BlocProvider(
          create: (ctx) => UserBloc(),
        ),
        BlocProvider(
          create: (ctx) => MidoplanBloc(ctx.read<UserBloc>()),
        ),
        BlocProvider(
          create: (ctx) => ActiveMidoplansBloc(ctx.read<MidoplanBloc>()),
        ),
        BlocProvider(
          create: (ctx) => CompletedMidoplansBloc(ctx.read<MidoplanBloc>()),
        ),
      ],
      child: MaterialApp(
        title: 'MI DO PLAN',
        theme: isDarkMode
            ? ThemeData.dark(
                useMaterial3: true,
              )
            : ThemeData.light(
                useMaterial3: true,
              ),
        // theme: ThemeData(
        //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //   //useMaterial3: true,
        // ),
        initialRoute: '/',
        routes: {
          '/': (context) => MidoPlanScreen(
                isDarkMode: isDarkMode,
                toggleDarkMode: toggleDarkMode,
              ),
          '/midoplan-details': (context) => const MidoplanDetailScreen(),
        },
      ),
    );
  }
}
