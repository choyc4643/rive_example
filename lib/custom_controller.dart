/// Demonstrates how to create a custom controller to change the speed of an
/// animation

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SpeedyAnimation extends StatelessWidget {
  const SpeedyAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Controller'),
      ),
      body: Center(
        child: RiveAnimation.network(
          'https://public.rive.app/community/runtime-files/2719-5586-hero-bot.riv',
          fit: BoxFit.fitWidth,
          animations: const ['idle'],
          controllers: [SpeedController('curves', speedMultiplier: 10)],
        ),
      ),
    );
  }
}

class SpeedController extends SimpleAnimation {
  final double speedMultiplier;

  SpeedController(
    String animationName, {
    double mix = 10,
    this.speedMultiplier = 10,
  }) : super(animationName, mix: mix);

  @override
  void apply(RuntimeArtboard artboard, double elapsedSeconds) {
    if (instance == null || !instance!.keepGoing) {
      isActive = false;
    }
    instance!
      ..animation.apply(instance!.time, coreContext: artboard, mix: mix)
      ..advance(elapsedSeconds * speedMultiplier);
  }
}
