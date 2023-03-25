# cake_labs_test

Test for Mobile Engineer Entry Role for Cake Labs

## Folder Architecture
cake_labs_test/  
├─ android/  
├─ ios/  
├─ web/  
├─ lib/  
├────| main.dart  
├────| data/  
├────────| local_storage_service.dart  
├────| domain/  
├────────| pin_code_repository.dart  
├────| presentation/  
├────────| create_pin_code_screen.dart  
├────────| confirm_pin_code_screen.dart  
├────────| authentication_pin_code_screen.dart  
├────────| menu_screen.dart  
├────────| widgets/  
├────────────| pin_code_indicator.dart  
├────────────| numeric_keyboard.dart  
├────────────|result_dialog_widget.dart  
├─ test/  
├─ .gitignore  
└─ pubspec.yaml  



Here is a brief explanation of the key files and folders:

lib/main.dart: The entry point of the application.  
lib/data: Contains the data access and storage implementation.  
lib/data/local_storage_service.dart: Local storage service using Hive for storing the PIN code.  
lib/domain: Contains the business logic (use cases, entities, etc.).  
lib/domain/pin_code_repository.dart: Repository for handling PIN code-related operations.  
lib/presentation: Contains the UI-related code (widgets, pages, etc.).  
lib/presentation/create_pin_code_screen.dart: Create PIN Code screen.  
lib/presentation/authentication_pin_code_screen.dart: Authentication by PIN Code screen.  
lib/presentation/menu_screen.dart: Menu screen.  
lib/presentation/widgets: Contains custom widgets.  
lib/presentation/widgets/pin_code_indicator.dart: PIN code indicator widget.  
lib/presentation/widgets/numeric_keyboard.dart: Numeric keyboard widget.  
lib/presentation/widgets/result_dialog_widget.dart: Results dialog widget.  
pubspec.yaml: Configuration file for the Flutter project, including dependencies.  
