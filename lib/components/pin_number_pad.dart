import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PinNumberPad extends StatefulWidget {
  final Function(String) numPadAction;
  final Function() deletePadAction;
  final bool biometricEnabled;
  final Function()? biometricAction;
  final TextStyle? textStyle;
  final Color? iconColor;

  const PinNumberPad({
    Key? key,
    required this.numPadAction,
    required this.deletePadAction,
    required this.biometricEnabled,
    required this.biometricAction,
    this.iconColor,
    this.textStyle
  }) : super(key: key);

  @override
  State<PinNumberPad> createState() => _PinNumberPadState();
}

class _PinNumberPadState extends State<PinNumberPad> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: KeyboardNumber(
                  textStyle: widget.textStyle,
                    number: 1,
                    onPressed: () {
                      widget.numPadAction("1");
                    }),
              ),
              Expanded(
                child: KeyboardNumber(
                    textStyle: widget.textStyle,
                    number: 2,
                    onPressed: () {
                      widget.numPadAction("2");
                    }),
              ),
              Expanded(
                child: KeyboardNumber(
                    textStyle: widget.textStyle,
                    number: 3,
                    onPressed: () {
                      widget.numPadAction("3");
                    }),
              )
            ],
          ),
          const SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: KeyboardNumber(
                    textStyle: widget.textStyle,
                    number: 4,
                    onPressed: () {
                      widget.numPadAction("4");
                    }),
              ),
              Expanded(
                child: KeyboardNumber(
                    textStyle: widget.textStyle,
                    number: 5,
                    onPressed: () {
                      widget.numPadAction("5");
                    }),
              ),
              Expanded(
                child: KeyboardNumber(
                    textStyle: widget.textStyle,
                    number: 6,
                    onPressed: () {
                      widget.numPadAction("6");
                    }),
              )
            ],
          ),
          const SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: KeyboardNumber(
                    textStyle: widget.textStyle,
                    number: 7,
                    onPressed: () {
                      widget.numPadAction("7");
                    }),
              ),
              Expanded(
                child: KeyboardNumber(
                    textStyle: widget.textStyle,
                    number: 8,
                    onPressed: () {
                      widget.numPadAction("8");
                    }),
              ),
              Expanded(
                child: KeyboardNumber(
                    textStyle: widget.textStyle,
                    number: 9,
                    onPressed: () {
                      widget.numPadAction("9");
                    }),
              )
            ],
          ),
          const SizedBox(height: 16,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                  child: InkWell(
                      onTap: widget.biometricAction,
                      child: Visibility(
                        visible: widget.biometricEnabled,
                        replacement: const SizedBox.shrink(),
                        child: SizedBox(
                          height: 90,
                          width: 90,
                          child: Center(child: Image(image: AssetImage('assets/icon.png', package: "flutter_pin_pad"), color: widget.iconColor,)
                          ),
                        ),
                      )
                  )
              ),
              Expanded(
                child: KeyboardNumber(
                    textStyle: widget.textStyle,
                    number: 0,
                    onPressed: () {
                      widget.numPadAction("0");
                    }),
              ),
              Expanded(
                child: InkWell(
                    onTap: () {
                      widget.deletePadAction();
                    },
                    child: SizedBox(
                        height: 90,
                        width: 90,
                        child: Center(child: Icon(Icons.backspace_outlined, color: widget.iconColor,))
                    )
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class KeyboardNumber extends StatelessWidget {
  final int number;
  final Function() onPressed;
  final TextStyle? textStyle;

  const KeyboardNumber(
      {Key? key, required this.number, required this.onPressed, this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      alignment: Alignment.center,
      child: InkWell(
        onTap: onPressed,
        child: SizedBox(
          height: 90,
          width: 90,
          child: Center(
            child: Text(
              "$number",
              textAlign: TextAlign.center,
              style: textStyle ?? const TextStyle(
                color: Colors.black,
                fontSize: 14
              ),
            ),
          ),
        ),
      ),
    );
  }
}