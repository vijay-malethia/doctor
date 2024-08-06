import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../common/app_colors.dart';

class Loader extends StatefulWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> bounceAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        animationBehavior: AnimationBehavior.preserve,
        vsync: this,
        duration: const Duration(milliseconds: 1300));

    // Bounce Animation
    bounceAnimation = Tween<double>(begin: 0, end: 3).animate(CurvedAnimation(
        parent: animationController, curve: Curves.easeInOutBack));
    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: animationController,
            builder: (_, child) {
              return Transform.translate(
                offset:
                    Offset(0, -25 * bounceAnimation.value), // Vertical bouncing
                child: child,
              );
            },
            child: AnimatedBuilder(
                animation: animationController,
                builder: (_, child) {
                  return Transform.rotate(
                      angle: animationController.value * 3 * math.pi,
                      child: child);
                },
                child: Container(
                    height: 80,
                    width: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: primaryColor),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.5, 0.5],
                          colors: [Colors.white, primaryColor],
                        )))),
          ),
          const Text('Loading...', style: TextStyle(color: primaryColor))
        ],
      ),
    );
  }
}
