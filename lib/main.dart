import 'package:finappassistant/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:finappassistant/config/router/app_router.dart';
import 'package:finappassistant/utils/constants/strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: applicationTitle,
      routerConfig: AppRouter(isLoggedIn: false).config(),
      darkTheme: darkTheme,
      theme: lightTheme
    );
  }
}

