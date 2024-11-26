import 'package:flutter/material.dart';
import 'package:news/home/view/widgets/custom_search_delegate.dart';
import 'package:news/shared/app_theme.dart';
import 'package:news/categories/data/models/category_model.dart';
import 'package:news/categories/view/widgets/categories_grid.dart';
import 'package:news/categories/view/widgets/category_detail.dart';
import 'package:news/home/view/widgets/home_drawer.dart';
import 'package:news/settings/view/widgets/settings_tab.dart';

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
                    ? 'News App'
                    : 'Settings',
          ),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(

                  ),
                );
                setState(() {});
              },
              icon: const Icon(
                Icons.search,
              ),
            ),
          ],
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
