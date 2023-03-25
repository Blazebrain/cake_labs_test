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
    return Container(
      margin: const EdgeInsets.all(20),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor:
              MaterialStateColor.resolveWith((states) => Colors.grey[200]!),
          shape: MaterialStateProperty.all(const CircleBorder()),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 28,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
