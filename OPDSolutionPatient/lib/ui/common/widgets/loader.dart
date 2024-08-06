import 'package:flutter/material.dart';
import 'dart:math';
import 'package:opdsolutionui/ui/common/index.dart';

class Loader extends StatefulWidget {
  const Loader({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  // ignore: unused_field
  late Animation<double> _animBounce;
  late Animation<double> _animRotation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1800),
      vsync: this,
    );
    _animBounce = Tween<double>(begin: -100, end: 40).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeInOutQuad),
      ),
    );
    _animRotation = Tween<double>(begin: 0, end: 360).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );

    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: 220,
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    double bounceOffset = sin(_controller.value * pi * 2) * 40;
                    return Transform.translate(
                      offset: Offset(0, bounceOffset),
                      child: Transform.rotate(
                        angle: _animRotation.value * (pi / 180),
                        child: child,
                      ),
                    );
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
              verticalSpaceSmall,
              verticalSpaceLarge,
              const Text('Loading...', style: TextStyle(color: primaryColor))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
