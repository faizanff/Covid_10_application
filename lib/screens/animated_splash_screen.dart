import 'dart:async';
import 'package:covid_19_project/screens/world_stats.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:get/get.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  late final AnimationController _controller = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this)..repeat();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(const Duration(seconds: 5), () => Get.offAll(() => const WorldStats())
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(animation: _controller,
                child: Container(
                  height: 200,
                  width: 200,
                  child: const Image(image: AssetImage("assets/images/virus.png"),),
                ),
                builder: (BuildContext context, Widget? child){
                  return Transform.rotate(angle: _controller.value * 2.5 * math.pi,child: child,);
                }),
            SizedBox(height: MediaQuery.of(context).size.height * .08,),
            const Align(
              alignment: Alignment.center,
              child: Text("Covid-19\nTracker App",textAlign: TextAlign.center,style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),
            ),
          ]
      ),
    );
  }
}

