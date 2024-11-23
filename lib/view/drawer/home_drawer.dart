import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key, required this.onItemSelected});

  final void Function(DrawerItem) onItemSelected;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    TextStyle? titleLarge = Theme.of(context).textTheme.titleLarge;
    return SizedBox(
      width: screenSize.width * 0.8,
      child: Column(
        children: [
          Container(
            height: screenSize.height * 0.12,
            width: double.infinity,
            alignment: Alignment.center,
            color: AppTheme.primary,
            child: Text(
              "News App!",
              style: titleLarge!.copyWith(
                fontSize: 24,
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: AppTheme.white,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(top: 12, start: 12),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => onItemSelected(DrawerItem.categories),
                      child: Row(
                        children: [
                          const Icon(Icons.menu),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Category',
                            style: titleLarge.copyWith(
                              color: AppTheme.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    InkWell(
                      onTap: () => onItemSelected(DrawerItem.settings),
                      child: Row(
                        children: [
                          const Icon(Icons.settings),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Settings',
                            style: titleLarge.copyWith(
                              color: AppTheme.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

enum DrawerItem {
  categories,
  settings,
}
