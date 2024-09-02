import 'package:flutter/material.dart';

import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../widgets/category_card.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          const CustomAppbar(title: 'Inventory'),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
              children: const [
                CategoryCard(
                  category: 'Coffee',
                  asset: 'category1',
                ),
                CategoryCard(
                  category: 'Desserts',
                  asset: 'category2',
                ),
                CategoryCard(
                  category: 'Syrup for Coffee',
                  asset: 'category3',
                ),
                CategoryCard(
                  category: 'Sugar',
                  asset: 'category4',
                ),
                CategoryCard(
                  category: 'Coffee Cups',
                  asset: 'category5',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
