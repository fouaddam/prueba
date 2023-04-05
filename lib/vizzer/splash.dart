
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'home.dart';


class Splash extends StatefulWidget{
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin{

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);

    _controller.addStatusListener((status) async{
      if(status==AnimationStatus.completed){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
        _controller.reset();
      }

    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();

  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(

        child: Container(
           child: Lottie.asset(
              'assets/Splash.json',
              controller: _controller,
              onLoaded: (composition) {
                // Configure the AnimationController with the duration of the
                // Lottie file and start the animation.
                _controller
                  ..duration = composition.duration
                  ..forward();
              },
            ),

        ),
      ),
    );
  }
}