import 'dart:math' show Random;
import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
   
  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  double myW = 50, myH = 50;
  Color contColor = Colors.green;
  BorderRadiusGeometry contBorder = BorderRadius.circular(10);

  void changeContainer() {
    final random = Random();
    myH = random.nextInt(300).toDouble() + 70;
    myW = random.nextInt(300).toDouble() + 70;
    contColor = Color.fromRGBO(random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
    contBorder = BorderRadius.circular(random.nextInt(100).toDouble() + 10);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          width: myW,
          height: myH,
          decoration: BoxDecoration(
            color: contColor,
            borderRadius: contBorder,
          ),
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOutExpo,
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow_rounded, size: 35),
        onPressed: () => changeContainer(),
      ),
    );
  }
}