import 'package:flutter/material.dart';

class Personita extends StatelessWidget {
  final size;

  Personita({this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration:
      //     BoxDecoration(border: Border.all(width: 1, color: Colors.black)),
      height: 90.0 * this.size,
      width: 45.0 * this.size,
      child: Image.asset('lib/src/images/personita.png'),
    );
  }
}
