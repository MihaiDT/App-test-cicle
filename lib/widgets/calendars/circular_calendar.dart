import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CircularCalendar extends StatelessWidget {
  const CircularCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.green,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.red,
          width: 4,
        ),
      ),
      height: Get.width * 0.8,
      width: Get.width * 0.8,
      child: const Stack(
        children: [
          Align(
            alignment: Alignment(1, 0),
            child: Text("D"),
          ),
          Align(
            alignment: Alignment(0, -1),
            child: Text("W"),
          ),
          Align(
            alignment: Alignment(-1, 0),
            child: Text("O"),
          ),
          Align(
            alignment: Alignment(0, 1),
            child: Text("R"),
          ),
        ],
      ),
    );
  }
}
