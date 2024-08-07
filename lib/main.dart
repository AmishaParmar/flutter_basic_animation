
import 'package:basic_animation/custom_painter_example/bouncing_ball_animation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const PulsatingCircleAnimation(),
            // home: const LoginScreenAnimation(),
// home:const ListAnimation(),
// home: const RadialProgressAnimation(progress: 0.65, color: Colors.purple),
// home: const SplashAnimation(),
home:const BouncingBallAnimation(),
    );
  }
}
