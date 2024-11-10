import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/view/categories/categories_grid.dart';
import 'package:news/view/drawer/home_drawer.dart';

class HomeScreen extends StatelessWidget {
  static const String route = 'home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.white,
        image: const DecorationImage(
          image: AssetImage('assets/images/pattern.png'),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("News App"),
        ),
        body: const CategoriesGrid(),
        drawer: HomeDrawer(),
      ),
    );
  }
}
