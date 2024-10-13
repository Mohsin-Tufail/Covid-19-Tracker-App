import 'dart:async';

import 'package:flutter/material.dart';
import 'package:api_practice/world_data_scr.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: Duration(seconds: 3), vsync: this)
        ..repeat();
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => WorldDataScr()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Design by Mohsin-Tufail",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.white38,
        centerTitle: true,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: AnimatedBuilder(
                  animation: _controller,
                  child: Container(
                    height: 200,
                    width: 200,
                    child: Image(image: AssetImage('Assets/virus_image.png')),
                  ),
                  builder: (context, child) {
                    return Transform.rotate(
                        angle: _controller.value * 2.0 * math.pi, child: child);
                  })),
          const Column(
            children: [
              Text(
                'Covid-19',
                style: TextStyle(
                    color: Colors.lightGreenAccent,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Tracker App',
                style: TextStyle(
                    color: Colors.lightGreenAccent,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}
