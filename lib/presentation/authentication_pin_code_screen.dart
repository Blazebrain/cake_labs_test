import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cake_labs_test/presentation/widgets/result_dialog_widget.dart';

import '../domain/pin_code_repository.dart';
import 'widgets/numeric_keyboard.dart';
import 'widgets/pin_code_indicator.dart';

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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              Text(
                'Enter your PIN',
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
                          _processEnteredPinCode(pinCodeRepository);
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
        return ResultsDialogWidget(
          message: message,
          isForAuthScreen: true,
        );
      },
    );
  }
}
