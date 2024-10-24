import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text('Dice'),
          backgroundColor: Colors.red,
        ),
        body: const DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int left = 1;
  int right = 1;
  String resultMessage = 'Roll the dice!';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      changeValue();
                    });
                    print('Left dice clicked');
                    print(left);
                  },
                  child: Image.asset('images/dice$left.png'),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      changeValue();
                    });
                    print('Right dice clicked');
                    print(right);
                  },
                  child: Image.asset('images/dice$right.png'),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20), // Space between dice and text
        Text(
          resultMessage,
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  void changeValue() {
    setState(() {
      left = 1 + Random().nextInt(6);
      right = 1 + Random().nextInt(6);

      int totalRoll = left + right;

      if (left > right) {
        resultMessage = 'The total roll is $totalRoll. Left dice rolls higher.';
      } else if (right > left) {
        resultMessage = 'The total roll is $totalRoll. Right dice rolls higher.';
      } else {
        resultMessage = 'The total roll is $totalRoll. Dice rolls are equal.';
      }
    });
  }
}
