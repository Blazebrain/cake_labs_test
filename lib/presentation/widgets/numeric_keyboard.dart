import 'package:flutter/material.dart';

typedef OnKeyPressed = void Function(String);

class NumericKeyboard extends StatelessWidget {
  final OnKeyPressed onKeyPressed;

  const NumericKeyboard({super.key, required this.onKeyPressed});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      children: List.generate(12, (index) {
        if (index == 9) {
          return const SizedBox.shrink();
        } else if (index == 10) {
          return _buildButton('0', onPressed: () => onKeyPressed('0'));
        } else if (index == 11) {
          return IconButton(
            onPressed: () => onKeyPressed('backspace'),
            icon: const Icon(Icons.backspace),
          );
        } else {
          return _buildButton('${index + 1}',
              onPressed: () => onKeyPressed('${index + 1}'));
        }
      }),
    );
  }

  Widget _buildButton(String text, {VoidCallback? onPressed}) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
