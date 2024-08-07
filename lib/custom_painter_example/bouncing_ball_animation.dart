import 'package:flutter/material.dart';

class BouncingBallAnimation extends StatefulWidget {
  const BouncingBallAnimation({super.key});

  @override
  State<BouncingBallAnimation> createState() => _BouncingBallAnimationState();
}

class _BouncingBallAnimationState extends State<BouncingBallAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation = Tween(begin: 0.0, end: 1.0).animate(controller);

    animation.addStatusListener((status){
     if (status == AnimationStatus.completed) {
       controller.reverse();
     }
     else if(status == AnimationStatus.dismissed){
      controller.forward();
     }
    });

   controller.forward();
  }
@override
void dispose() {
  controller.dispose();
  super.dispose();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return CustomPaint(
                    size: const Size(200, 200),
                    painter: BouncingBallPainter(animation.value),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class BouncingBallPainter extends CustomPainter {
  final double animationValue;
  BouncingBallPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    canvas.drawCircle(
        Offset(size.width / 2, size.height - (size.height * animationValue)),
        20,
        Paint()..color = Colors.blue

        //above line of Paint()..color = Colors.blue is similar to this code-->  var paint = Paint(); paint.color = Colors.blue;

        );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
