
import 'package:flutter/material.dart';

class CardShadow extends StatelessWidget {
  final Widget? child;

  const CardShadow({Key? key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      shadowColor: Colors.black26,
      margin: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13),
      ),
      child: child,
    );
  }
}
