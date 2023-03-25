import 'package:flutter/material.dart';

import 'widgets/pin_code_indicator.dart';
import 'widgets/numeric_keyboard.dart';

class CreatePinCodeScreen extends StatefulWidget {
  const CreatePinCodeScreen({super.key});

  @override
  State<CreatePinCodeScreen> createState() => _CreatePinCodeScreenState();
}

class _CreatePinCodeScreenState extends State<CreatePinCodeScreen> {
  String _enteredPinCode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create PIN Code')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PinCodeIndicator(enteredPinCodeLength: _enteredPinCode.length),
            const SizedBox(height: 20),
            NumericKeyboard(onKeyPressed: (key) {
              setState(() {
                if (key == 'backspace') {
                  if (_enteredPinCode.isNotEmpty) {
                    _enteredPinCode = _enteredPinCode.substring(
                        0, _enteredPinCode.length - 1);
                  }
                } else if (_enteredPinCode.length < 4) {
                  _enteredPinCode += key;
                  if (_enteredPinCode.length == 4) {
                    _navigateToConfirmPinCodeScreen(context);
                  }
                }
              });
            }),
          ],
        ),
      ),
    );
  }

  void _navigateToConfirmPinCodeScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ConfirmPinCodeScreen(firstEnteredPinCode: _enteredPinCode),
      ),
    ).then((_) {
      _enteredPinCode = '';
      setState(() {});
    });
  }
}
