import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ColorChanger(),
  ));
}

class ColorChanger extends StatefulWidget {
  const ColorChanger({super.key});

  @override
  State<ColorChanger> createState() => _ColorChangerState();
}

class _ColorChangerState extends State<ColorChanger> {
  final Random random = Random();

  int r = 120;
  int g = 70;
  int b = 200;

  int directionIndex = 0;

  final List<List<Alignment>> directions = [
    [Alignment.topCenter, Alignment.bottomCenter],   
    [Alignment.centerLeft, Alignment.centerRight],     
    [Alignment.topLeft, Alignment.bottomRight],        
    [Alignment.bottomRight, Alignment.topLeft],        
  ];

  final List<String> directionText = [
    "Alignment: Vertical",
    "Alignment: Horizontal",
    "Alignment: Left-Right",
    "Alignment: Right-Left",
  ];

  void changeColor() {
    setState(() {
      r = random.nextInt(256);
      g = random.nextInt(256);
      b = random.nextInt(256);
    });
  }

  void changeDirection() {
    setState(() {
      directionIndex = (directionIndex + 1) % 4;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, r, g, b),
            Color.fromARGB(255, g, r, b),
          ],
          begin: directions[directionIndex][0],
          end: directions[directionIndex][1],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            OutlinedButton(
              onPressed: changeColor,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.white, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 40,
                ),
              ),
              child: const Text(
                "Change Color",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
            ),

            const SizedBox(height: 15),

            Text(
              "Red: $r Green: $g Blue: $b",
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
            ),

            const SizedBox(height: 40),

            OutlinedButton(
              onPressed: changeDirection,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.white, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 40,
                ),
              ),
              child: const Text(
                "Change Direction",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
            ),

            const SizedBox(height: 15),

            Text(
              directionText[directionIndex],
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
