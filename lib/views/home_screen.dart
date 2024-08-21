import 'package:flutter/material.dart';

class Animated extends StatefulWidget {
  const Animated({super.key});

  @override
  State<Animated> createState() => _AnimatedState();
}

class _AnimatedState extends State<Animated> {
  double _rocketPosition = 400; // initial position of the rocket
  double _objectPosition = 0; // initial position of the object

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: _rocketPosition,
            left: 150,
            child: AnimatedContainer(
              duration: Duration(seconds: 2),
              curve: Curves.easeInOut,
              child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8ZMe5LT-2tn4oeId8YVQ-XgQv1ETs_p3Z7A&s",
                width: 100,
                height: 100,
              ),
            ),
          ),
          Positioned(
            top: _objectPosition,
            left: 250,
            child: AnimatedContainer(
              duration: Duration(seconds: 2),
              curve: Curves.bounceOut,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _rocketPosition = 0; // move the rocket to the top
            _objectPosition = 400; // move the object to the bottom
          });
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
