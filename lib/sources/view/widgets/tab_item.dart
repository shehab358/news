import 'package:flutter/material.dart';
import 'package:news/shared/app_theme.dart';

class TabItem extends StatelessWidget {
  TabItem({super.key, required this.name, required this.isSelected});

  final String name;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: isSelected ? AppTheme.primary : Colors.transparent,
        border: Border.all(
          width: 2,
          color: AppTheme.primary,
        ),
        borderRadius: BorderRadius.circular(
          25,
        ),
      ),
      child: Text(
        name,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: isSelected ? AppTheme.white : AppTheme.primary,
            ),
      ),
    );
  }
}
