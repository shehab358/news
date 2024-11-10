import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/category_model.dart';
import 'package:news/view/categories/categories_grid.dart';
import 'package:news/view/categories/category_detail.dart';
import 'package:news/view/drawer/home_drawer.dart';
import 'package:news/view/settings/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String route = 'home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          title: Text(
            selectedCategory != null
                ? selectedCategory!.name
                : selectedDraweItem == DrawerItem.categories
                    ? 'NewsApp'
                    : 'Settings',
          ),
        ),
        body: selectedCategory != null
            ? CategoryDetail(selectedCategory!.id)
            : selectedDraweItem == DrawerItem.categories
                ? CategoriesGrid(
                    onCategorySelected: onCategorySelected,
                  )
                : const SettingsTab(),
        drawer: HomeDrawer(onItemSelected: onDrawerItemSelected),
      ),
    );
  }

  DrawerItem selectedDraweItem = DrawerItem.categories;
  CategoryModel? selectedCategory;

  void onDrawerItemSelected(DrawerItem item) {
    selectedDraweItem = item;
    setState(() {});
    Navigator.pop(context);
    selectedCategory = null;
  }

  void onCategorySelected(CategoryModel category) {
    selectedCategory = category;
    setState(() {});
  }
}
