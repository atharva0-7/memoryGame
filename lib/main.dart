import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_game/bloc/card_bloc.dart';
import 'package:memory_game/constants/color_constant.dart';
import 'package:memory_game/screens/loading_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CardBloc(),
      child: MaterialApp(
        theme: ThemeData(primarySwatch: kLoadingBrownColor),
        home: const LoadingScreen(),
      ),
    );
  }
}
