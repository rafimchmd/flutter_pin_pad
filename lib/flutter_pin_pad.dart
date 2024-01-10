library flutter_pin_pad;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/pin_dot.dart';
import 'components/pin_number_pad.dart';
import 'components/pin_row.dart';

class FlutterPINPad extends StatefulWidget {
  final Function(String) successAction;
  final String descriptionText;
  final bool biometricEnabled;
  final Function()? biometricAction;
  final Function()? backAction;
  final Function()? deleteAction;
  final bool? errorTextVisible;
  final String? errorText;
  final bool? forgotPinButtonVisible;
  final Function()? forgotPinAction;
  final bool? warningBoxVisible;
  final Color? warningBoxColor;
  final String? warningText;
  final IconData? warningIcon;
  final Color? warningTextColor;
  final Color? warningIconColor;
  final Color dotFillColor;
  final Color dotColor;
  final TextStyle? textStyle;
  final Color? iconColor;

  const FlutterPINPad({
    Key? key,
    required this.descriptionText,
    required this.successAction,
    required this.dotColor,
    required this.dotFillColor,
    this.backAction,
    this.deleteAction,
    this.biometricEnabled = true,
    this.biometricAction,
    this.errorTextVisible = false,
    this.errorText,
    this.forgotPinButtonVisible = false,
    this.forgotPinAction,
    this.warningBoxVisible = false,
    this.warningBoxColor,
    this.warningText,
    this.warningTextColor,
    this.warningIcon,
    this.warningIconColor,
    this.textStyle,
    this.iconColor
  }) : super(key: key);

  @override
  State<FlutterPINPad> createState() => _FlutterPINPadState();
}

class _FlutterPINPadState extends State<FlutterPINPad> {

  int pinIndex = 0;
  List<String> currentPin = ["", "", "", "", "", ""];
  String strPin = "";
  late PinDot dotOne;
  late PinDot dotTwo;
  late PinDot dotThree;
  late PinDot dotFour;
  late PinDot dotFive;
  late PinDot dotSix;

  removeLastPIN(int n) {
    switch (n) {
      case 1:
        setState(() {
          dotOne = PinDot(fillColor: widget.dotColor);
        });
        break;
      case 2:
        setState(() {
          dotTwo = PinDot(fillColor: widget.dotColor);
        });
        break;
      case 3:
        setState(() {
          dotThree = PinDot(fillColor: widget.dotColor);
        });
        break;
      case 4:
        setState(() {
          dotFour = PinDot(fillColor: widget.dotColor);
        });
        break;
      case 5:
        setState(() {
          dotFive = PinDot(fillColor: widget.dotColor);
        });
        break;
      case 6:
        setState(() {
          dotSix = PinDot(fillColor: widget.dotColor);
        });
        break;
    }
    if (pinIndex > 1) {
      currentPin[pinIndex - 1] = "";
      pinIndex--;
    } else {
      pinIndex = 0;
    }
  }

  setPinIndex(String stringPin) {
    if (pinIndex == 0) {
      pinIndex = 1;
      setPin(pinIndex, stringPin);
      currentPin[pinIndex - 1] = stringPin;
      for (var element in currentPin) {
        strPin += element;
      }
    } else if (pinIndex < 6) {
      pinIndex++;
      setPin(pinIndex, stringPin);
      currentPin[pinIndex - 1] = stringPin;
      for (var element in currentPin) {
        strPin += element;
      }
    }
    if(pinIndex == 6) {
      widget.successAction(currentPin.join(""));
    }
  }

  setPin(int n, String text) {
    switch (n) {
      case 1:
        setState(() {
          dotOne = PinDot(fillColor: widget.dotFillColor);
        });
        break;
      case 2:
        setState(() {
          dotTwo = PinDot(fillColor: widget.dotFillColor);
        });
        break;
      case 3:
        setState(() {
          dotThree = PinDot(fillColor: widget.dotFillColor);
        });
        break;
      case 4:
        setState(() {
          dotFour = PinDot(fillColor: widget.dotFillColor);
        });
        break;
      case 5:
        setState(() {
          dotFive = PinDot(fillColor: widget.dotFillColor);
        });
        break;
      case 6:
        setState(() {
          dotSix = PinDot(fillColor: widget.dotFillColor);
        });
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    dotOne = PinDot(fillColor: widget.dotColor);
    dotTwo = PinDot(fillColor: widget.dotColor);
    dotThree = PinDot(fillColor: widget.dotColor);
    dotFour = PinDot(fillColor: widget.dotColor);
    dotFive = PinDot(fillColor: widget.dotColor);
    dotSix = PinDot(fillColor: widget.dotColor);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 26,),
                Text(
                    widget.descriptionText,
                    style: widget.textStyle ?? const TextStyle(color: Colors.black)
                ),
                const SizedBox(
                  height: 32.0,
                ),
                PinRow(
                  dotOne: dotOne,
                  dotTwo: dotTwo,
                  dotThree: dotThree,
                  dotFour: dotFour,
                  dotFive: dotFive,
                  dotSix: dotSix,
                ),
                Visibility(
                  visible: widget.errorTextVisible ?? false,
                  child: Column(
                    children: [
                      const SizedBox(height: 32,),
                      Text(widget.errorText ?? "", style: widget.textStyle ?? const TextStyle(color: Colors.red),),
                    ],
                  ),
                ),
                // Visibility(
                //   visible: widget.forgotPinButtonVisible ?? false,
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 16.0),
                //     child: Column(
                //       children: [
                //         SizedBox(height: (widget.errorTextVisible ?? false) ? 16 : (widget.warningBoxVisible ?? false) ? 16  : 32,),
                //         SizedBox(
                //           width: 143,
                //           child: DokuOutlineButton(
                //             outlineColor: DokuColors.neutral30,
                //             onPressed: widget.forgotPinAction,
                //             child: Text("forgot_pin".tr, style: DokuTextStylesColored.bodySMediumNeutral80,),
                //           ),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
            PinNumberPad(
              textStyle: widget.textStyle,
              biometricEnabled: widget.biometricEnabled,
              biometricAction: widget.biometricAction,
              iconColor: widget.iconColor,
              numPadAction: (strValue) {
                setPinIndex(strValue);
              },
              deletePadAction: () {
                if(widget.deleteAction != null) {
                  widget.deleteAction!();
                }
                removeLastPIN(pinIndex);
              },
            )
          ],
        ));
  }
}
