import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../domain/pin_code_repository.dart';
import 'menu_screen.dart';
import 'widgets/pin_code_indicator.dart';
import 'widgets/numeric_keyboard.dart';

class AuthenticationPinCodeScreen extends StatefulWidget {
  const AuthenticationPinCodeScreen({super.key});

  @override
  State<AuthenticationPinCodeScreen> createState() =>
      _AuthenticationPinCodeScreenState();
}

class _AuthenticationPinCodeScreenState
    extends State<AuthenticationPinCodeScreen> {
  String _enteredPinCode = '';

  @override
  Widget build(BuildContext context) {
    final pinCodeRepository = Provider.of<PinCodeRepository>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Authentication')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PinCodeIndicator(enteredPinCodeLength: _enteredPinCode.length),
            const SizedBox(height: 20),
            NumericKeyboard(
              onKeyPressed: (key) {
                setState(
                  () {
                    if (key == 'backspace') {
                      if (_enteredPinCode.isNotEmpty) {
                        _enteredPinCode = _enteredPinCode.substring(
                          0,
                          _enteredPinCode.length - 1,
                        );
                      }
                    } else if (_enteredPinCode.length < 4) {
                      _enteredPinCode += key;
                      if (_enteredPinCode.length == 4) {
                        _processEnteredPinCode(pinCodeRepository);
                      }
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _processEnteredPinCode(PinCodeRepository pinCodeRepository) {
    final storedPinCode = pinCodeRepository.getPinCode();
    if (storedPinCode == _enteredPinCode) {
      _showMessage('Authentication success');
    } else {
      _showMessage('Authentication failed');
    }
    _enteredPinCode = '';
    setState(() {});
  }

  void _showMessage(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Authentication'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                if (message.contains('success')) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MenuScreen(),
                    ),
                  );
                } else {
                  Navigator.pop(context);
                }
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
