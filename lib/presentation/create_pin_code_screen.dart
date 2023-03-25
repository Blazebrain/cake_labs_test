import 'package:cake_labs_test/presentation/confirm_pin_code_screen.dart';
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
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 18, right: 12),
            child: Text(
              'Use 4-digits PIN',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),
          )
        ],
        centerTitle: true,
        title: Text(
          'Setup PIN',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[900],
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                'Create PIN',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 28),
              PinCodeIndicator(enteredPinCodeLength: _enteredPinCode.length),
              const Spacer(),
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
                          _navigateToConfirmPinCodeScreen(context);
                        }
                      }
                    },
                  );
                },
              ),
              const Spacer(),
            ],
          ),
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
