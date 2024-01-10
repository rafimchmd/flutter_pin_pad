import 'package:flutter/cupertino.dart';
import 'package:flutter_pin_pad/components/pin_dot.dart';

class PinRow extends StatefulWidget {
  final PinDot dotOne;
  final PinDot dotTwo;
  final PinDot dotThree;
  final PinDot dotFour;
  final PinDot dotFive;
  final PinDot dotSix;
  const PinRow({
    Key? key,
    required this.dotOne,
    required this.dotTwo,
    required this.dotThree,
    required this.dotFour,
    required this.dotFive,
    required this.dotSix
  }) : super(key: key);

  @override
  State<PinRow> createState() => _PinRowState();
}

class _PinRowState extends State<PinRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        const SizedBox(width: 72,),
        widget.dotOne,
        widget.dotTwo,
        widget.dotThree,
        widget.dotFour,
        widget.dotFive,
        widget.dotSix,
        const SizedBox(width: 72,),
      ],
    );
  }
}
