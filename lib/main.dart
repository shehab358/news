import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        
      },
      initialRoute: ,
      theme: AppTheme.lightTheme,
    );
  }
}