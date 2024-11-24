import 'package:flutter/material.dart';
import 'package:news/shared/app_theme.dart';
import 'package:news/home/view/screens/home_screen.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.route: (_) => const HomeScreen(),
      },
      initialRoute: HomeScreen.route,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
    );
  }
}
