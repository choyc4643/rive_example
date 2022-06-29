/// Demonstrates playing a one-shot animation on demand

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_test/play_pause_animation.dart';
import 'package:rive_test/simple_machine_listener.dart';
import 'package:rive_test/simple_state_machine.dart';
import 'package:rive_test/state_machine_skills.dart';

import 'custom_controller.dart';
import 'example_state_machine.dart';
import 'liquid_download.dart';
import 'little_machine.dart';
import 'simple_animation.dart';

void main() {
  runApp(MaterialApp(home: PlayOneShotAnimation()));
}

class PlayOneShotAnimation extends StatefulWidget {
  const PlayOneShotAnimation({Key? key}) : super(key: key);

  @override
  _PlayOneShotAnimationState createState() => _PlayOneShotAnimationState();
}

class _PlayOneShotAnimationState extends State<PlayOneShotAnimation> {
  /// Controller for playback
  late RiveAnimationController _controller;

  /// Is the animation currently playing?
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = OneShotAnimation(
      'bounce',
      autoplay: false,
      onStop: () => setState(() => _isPlaying = false),
      onStart: () => setState(() => _isPlaying = true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('One-Shot Example'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: RiveAnimation.network(
                'https://cdn.rive.app/animations/vehicles.riv',
                animations: const ['idle', 'curves'],
                controllers: [_controller],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: (){
              Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SpeedyAnimation()),
  );
          }, child: Text('SpeedyAnimation')),
          ElevatedButton(
            onPressed: (){
              Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ExampleStateMachine()),
  );
          }, child: Text('ExampleStateMachine')),
          ElevatedButton(
            onPressed: (){
              Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => LiquidDownload()),
  );
          }, child: Text('LiquidDownload')),
          ElevatedButton(
            onPressed: (){
              Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => LittleMachine()),
  );
          }, child: Text('LittleMachine')),
          ElevatedButton(
            onPressed: (){
              Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => PlayOneShotAnimation()),
  );
          }, child: Text('PlayOneShotAnimation')),
          ElevatedButton(
            onPressed: (){
              Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => PlayPauseAnimation()),
  );
          }, child: Text('PlayPauseAnimation')),
          ElevatedButton(
            onPressed: (){
              Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => StateMachineSkills()),
  );
          }, child: Text('StateMachineSkills')),
          ElevatedButton(
            onPressed: (){
              Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => StateMachineListener()),
  );
          }, child: Text('StateMachineListener')),
          ElevatedButton(
            onPressed: (){
              Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SimpleStateMachine()),
  );
          }, child: Text('SimpleStateMachine')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        // disable the button while playing the animation
        onPressed: () => _isPlaying ? null : _controller.isActive = true,
        tooltip: 'Play',
        child: const Icon(Icons.arrow_upward),
      ),
    );
  }
}
