import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cake_labs_test/domain/pin_code_repository.dart';
import 'package:cake_labs_test/presentation/widgets/numeric_keyboard.dart';
import 'package:cake_labs_test/presentation/widgets/pin_code_indicator.dart';
import 'package:cake_labs_test/presentation/widgets/result_dialog_widget.dart';

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
                'Re-enter your PIN',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 28),
              PinCodeIndicator(enteredPinCodeLength: _enteredPinCode.length),
              const Spacer(),
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
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  void _processEnteredPinCode(PinCodeRepository pinCodeRepository) {
    if (widget.firstEnteredPinCode == _enteredPinCode) {
      pinCodeRepository.setPinCode(_enteredPinCode);
      _showMessage('Your PIN has been setup successfully!');
    } else {
      _enteredPinCode = '';
      setState(() {});
      _showMessage('PIN codes do not match');
    }
  }

  void _showMessage(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ResultsDialogWidget(message: message, isForAuthScreen: false);
      },
    );
  }
}
