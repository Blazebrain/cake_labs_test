import 'package:flutter/material.dart';

import '../menu_screen.dart';

class ResultsDialogWidget extends StatelessWidget {
  final String message;
  final bool isForAuthScreen;
  const ResultsDialogWidget({
    super.key,
    required this.message,
    required this.isForAuthScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 72),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          if (!isForAuthScreen) ...[
            const SizedBox(height: 8),
            const Divider(),
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
          ]
        ],
      ),
    );
  }
}
