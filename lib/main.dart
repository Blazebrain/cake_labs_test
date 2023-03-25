import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/local_storage_service.dart';
import 'domain/pin_code_repository.dart';
import 'presentation/menu_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final localStorageService = LocalStorageService();
  await localStorageService.init();
  final pinCodeRepository = PinCodeRepository(localStorageService);

  runApp(MyApp(pinCodeRepository: pinCodeRepository));
}

class MyApp extends StatelessWidget {
  final PinCodeRepository pinCodeRepository;

  const MyApp({super.key, required this.pinCodeRepository});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PinCodeRepository>.value(value: pinCodeRepository),
      ],
      child: MaterialApp(
        title: 'Flutter PIN Code Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MenuScreen(),
      ),
    );
  }
}
