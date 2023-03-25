import 'package:flutter/material.dart';

typedef OnKeyPressed = void Function(String);

class NumericKeyboard extends StatefulWidget {
  final OnKeyPressed onKeyPressed;

  const NumericKeyboard({
    Key? key,
    required this.onKeyPressed,
  }) : super(key: key);

  @override
  State<NumericKeyboard> createState() => _NumericKeyboardState();
}

class _NumericKeyboardState extends State<NumericKeyboard> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      children: List.generate(12, (index) {
        if (index == 9) {
          return const SizedBox.shrink();
        } else if (index == 10) {
          return _buildButton('0', onPressed: () => widget.onKeyPressed('0'));
        } else if (index == 11) {
          return IconButton(
            onPressed: () => widget.onKeyPressed('backspace'),
            icon: const Icon(Icons.backspace),
          );
        } else {
          return _buildButton('${index + 1}',
              onPressed: () => widget.onKeyPressed('${index + 1}'));
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
