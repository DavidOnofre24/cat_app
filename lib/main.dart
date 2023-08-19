import 'package:cat_app/dependency_injection/dependecies_injection.dart';
import 'package:cat_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/home/cubit/home_provider.dart';

void main() async {
  await setupDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat Breeds',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          homeCubitProvider(),
        ],
        child: const HomeScreen(),
      ),
    );
  }
}
