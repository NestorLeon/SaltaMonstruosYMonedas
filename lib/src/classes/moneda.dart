import 'package:flutter/material.dart';

class Moneda extends StatelessWidget {
  final size;

  Moneda({this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration:
      //     BoxDecoration(border: Border.all(width: 1, color: Colors.black)),
      width: 34.0 * this.size,
      height: 40.0 * this.size,
      child: Image.asset('lib/src/images/moneda.png'),
    );
  }
}
