import 'package:flutter/material.dart';

class PinCodeIndicator extends StatelessWidget {
  final int enteredPinCodeLength;
  final int pinCodeLength;

  const PinCodeIndicator(
      {super.key, required this.enteredPinCodeLength, this.pinCodeLength = 4});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(pinCodeLength, (index) {
        return Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index < enteredPinCodeLength ? Colors.blue : Colors.grey,
          ),
        );
      }),
    );
  }
}
