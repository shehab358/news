import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/category_model.dart';
import 'package:news/view/categories/category_item.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key, required this.onCategorySelected});
  final void Function(CategoryModel) onCategorySelected;

  @override
  Widget build(BuildContext context) {
    final categories = [
      CategoryModel(
        id: 'sports',
        name: "sports",
        imageName: 'sports',
        color: AppTheme.red,
      ),
      CategoryModel(
        id: 'business',
        name: "Business",
        imageName: 'bussines',
        color: AppTheme.brown,
      ),
      CategoryModel(
        id: 'entertainment',
        name: "Entertainment",
        imageName: 'sports',
        color: AppTheme.navy,
      ),
      CategoryModel(
        id: 'general',
        name: "General",
        imageName: 'Politics',
        color: AppTheme.blue,
      ),
      CategoryModel(
        id: 'health',
        name: "Health",
        imageName: 'health',
        color: AppTheme.pink,
      ),
      CategoryModel(
        id: 'science',
        name: "Science",
        imageName: 'science',
        color: AppTheme.yellow,
      ),
      CategoryModel(
        id: 'technology',
        name: "Technology",
        imageName: 'environment',
        color: AppTheme.lightBlue,
      ),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              'Pick your category of interest',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: AppTheme.navy,
                  ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
              ),
              itemBuilder: (_, index) {
                CategoryModel category = categories[index];
                return InkWell(
                  onTap: () {
                    onCategorySelected(category);
                  },
                  child: CategoryItem(
                    index: index,
                    category: category,
                  ),
                );
              },
              itemCount: categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
