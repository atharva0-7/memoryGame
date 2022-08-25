import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:memory_game/constants/color_constant.dart';
import 'package:memory_game/constants/text_constant.dart';
import 'package:memory_game/screens/main_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future delayTimer() {
    return Future.delayed(const Duration(seconds: 3)).whenComplete(() =>
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const MainScreen())));
  }

  @override
  void initState() {
    super.initState();
    delayTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackGroundColor,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            kLoadingTitleText,
            SpinKitCircle(
              size: 50,
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                      color:
                          index.isEven ? kLoadingRedColor : kLoadingBrownColor),
                );
              },
            )
          ]),
    );
  }
}
