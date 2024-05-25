import 'package:flutter/material.dart';

class Meta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.amberAccent,
        border: Border.all(width: 10, color: Colors.deepOrange),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
