import 'package:flutter/material.dart';

class PinCodeIndicator extends StatelessWidget {
  final int enteredPinCodeLength;
  final int pinCodeLength;

  const PinCodeIndicator(
      {super.key, required this.enteredPinCodeLength, this.pinCodeLength = 4});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pinCodeLength,
        (index) {
          return Container(
            width: 10,
            height: 10,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index < enteredPinCodeLength
                  ? Colors.deepPurple
                  : Colors.transparent,
              border: Border.all(
                color: index < enteredPinCodeLength
                    ? Colors.transparent
                    : Colors.grey[400]!,
              ),
            ),
          );
        },
      ),
    );
  }
}
