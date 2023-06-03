import 'package:clean_artitecture/src/config/app_themes.dart';
import 'package:clean_artitecture/src/config/routes/app_router.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppThemes.lightTheme,
      routerConfig: router,
    );
  }
}
