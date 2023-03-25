import 'package:flutter/material.dart';
import 'create_pin_code_screen.dart';
import 'authentication_pin_code_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menu')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreatePinCodeScreen()),
                );
              },
              child: const Text('Create PIN Code'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const AuthenticationPinCodeScreen()),
                );
              },
              child: const Text('Authentication'),
            ),
          ],
        ),
      ),
    );
  }
}
