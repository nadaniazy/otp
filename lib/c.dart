import 'package:flutter/material.dart';
import 'dart:math';
class CircularProgressWithText extends StatefulWidget {
  final int totalSteps;
  final double width;
  final double height;
  CircularProgressWithText({
    required this.totalSteps,
    required this.width,
    required this.height,
  });

  @override
  _CircularProgressWithTextState createState() =>
      _CircularProgressWithTextState();
}

class _CircularProgressWithTextState extends State<CircularProgressWithText>
    with TickerProviderStateMixin {
  int currentStep = 1;
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(

    /// [AnimationController]s can be created with `vsync: this` because of
    /// [TickerProviderStateMixin].
    vsync: this,
    duration: const Duration(seconds: 1),
    )
    ..addListener(() {
    print(controller.value);
    setState(() {});
    });
    controller.forward();
    super.initState();
  }

  void _incrementStep() {
    if (currentStep < widget.totalSteps) {
      setState(() {
        currentStep++;
        controller.reset();
        controller.forward();
      });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _incrementStep();
      },
      child: Container(
        width: widget.width + 2,
        height: widget.height + 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: widget.width,
                height: widget.height,
                child: CircularProgressIndicator(
                  value: ((currentStep - 1) + controller.value) / widget.totalSteps,
                  strokeWidth: 8,
                ),
              )
              ,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$currentStep',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'of ${widget.totalSteps}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}