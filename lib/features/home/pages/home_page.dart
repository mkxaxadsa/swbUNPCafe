import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/no_data.dart';
import '../../cafe/bloc/cafe_bloc.dart';
import '../widgets/cafe_card.dart';
import '../widgets/coffee_shop_card.dart';
import '../widgets/home_inventory.dart';
import '../widgets/home_news_card.dart';
import '../widgets/home_revenue_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          const CustomAppbar(
            title: '',
            home: true,
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const SizedBox(height: 12),
                SizedBox(
                  height: 194,
                  child: BlocBuilder<CafeBloc, CafeState>(
                    builder: (context, state) {
                      if (state is CafeLoadedState) {
                        if (state.cafes.isEmpty) return const NoData();

                        return ListView(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.zero,
                          children: [
                            const SizedBox(width: 24),
                            ...List.generate(
                              state.cafes.length,
                              (index) {
                                return CafeCard(cafe: state.cafes[index]);
                              },
                            ),
                            const SizedBox(width: 12),
                          ],
                        );
                      }

                      return Container();
                    },
                  ),
                ),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    SizedBox(width: 24),
                    CoffeeShopCard(),
                    SizedBox(width: 14),
                    HomeInventory(),
                    SizedBox(width: 24),
                  ],
                ),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    SizedBox(width: 24),
                    HomeRevenueCard(),
                    SizedBox(width: 24),
                  ],
                ),
                const SizedBox(height: 14),
                const Row(
                  children: [
                    SizedBox(width: 24),
                    HomeNewsCard(),
                    SizedBox(width: 24),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
