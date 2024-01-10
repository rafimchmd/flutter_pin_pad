import 'package:flutter/cupertino.dart';

class PinDot extends StatelessWidget {
  final Color fillColor;

  const PinDot({super.key, required this.fillColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: fillColor,
      ),
    );
  }
}