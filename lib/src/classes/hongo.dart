import 'package:flutter/material.dart';

class Hongo extends StatelessWidget {
  final size;

  Hongo({this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration:
      //     BoxDecoration(border: Border.all(width: 1, color: Colors.black)),
      width: 36.0 * this.size,
      height: 40.0 * this.size,
      child: Image.asset('lib/src/images/hongo.png'),
    );
  }
}
