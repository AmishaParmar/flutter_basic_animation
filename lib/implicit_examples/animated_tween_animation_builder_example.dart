import 'package:flutter/material.dart';

class PulsatingCircleAnimation extends StatelessWidget {
  const PulsatingCircleAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pulsating Circle Animation'),
      ),
      body: Center(
        child: TweenAnimationBuilder(
          curve: Curves.easeInExpo,
          tween: Tween(begin:0.0,end: 200.0 ) ,
          //or tween <double>(begin:0, end:200), as width and height takes double so we can't use integer here. we have to use double here.
          duration: const Duration(milliseconds: 1500),
          builder: (context, size,widget) {
            return Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.5),
                    blurRadius: size,
                    spreadRadius: size / 2,
                  ),
                   BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: size/5,
                    spreadRadius: size/5 ,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
