import 'package:cake_labs_test/domain/pin_code_repository.dart';
import 'package:cake_labs_test/presentation/widgets/numeric_keyboard.dart';
import 'package:cake_labs_test/presentation/widgets/pin_code_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfirmPinCodeScreen extends StatefulWidget {
  final String firstEnteredPinCode;

  const ConfirmPinCodeScreen({super.key, required this.firstEnteredPinCode});

  @override
  State<ConfirmPinCodeScreen> createState() => _ConfirmPinCodeScreenState();
}

class _ConfirmPinCodeScreenState extends State<ConfirmPinCodeScreen> {
  String _enteredPinCode = '';

  @override
  Widget build(BuildContext context) {
    final pinCodeRepository = Provider.of<PinCodeRepository>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Confirm PIN Code')),
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
                    _processEnteredPinCode(pinCodeRepository);
                  }
                }
              });
            }),
          ],
        ),
      ),
    );
  }

  void _processEnteredPinCode(PinCodeRepository pinCodeRepository) {
    if (widget.firstEnteredPinCode == _enteredPinCode) {
      pinCodeRepository.setPinCode(_enteredPinCode);
      _showMessage('Your PIN code is successfully created');
      Navigator.popUntil(context, (route) => route.isFirst);
    } else {
      _enteredPinCode = '';
      setState(() {});
      _showMessage('PIN codes do not match');
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
