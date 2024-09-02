import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/models/chart_data.dart';
import '../../../core/models/revenue.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/no_data.dart';
import '../bloc/revenue_bloc.dart';
import '../widgets/revenue_card.dart';
import '../widgets/statistics_card.dart';
import '../widgets/tab_widget.dart';

class RevenuePage extends StatefulWidget {
  const RevenuePage({super.key});

  @override
  State<RevenuePage> createState() => _RevenuePageState();
}

class _RevenuePageState extends State<RevenuePage> {
  bool revenue = true;

  List<Revenue> getSorted(List<Revenue> data) {
    List<Revenue> sorted1 = [];
    List<Revenue> sorted2 = [];
    for (Revenue i in data) {
      if (i.revenue) {
        sorted1.add(i);
      } else {
        sorted2.add(i);
      }
    }
    if (revenue) return sorted1;
    return sorted2;
  }

  void changeTab(bool value) {
    if (value != revenue) {
      setState(() {
        revenue = value;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<RevenueBloc>().add(GetRevenuesEvent());

  }
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          const CustomAppbar(title: 'Revenue & Expenses'),
          BlocBuilder<RevenueBloc, RevenueState>(
            builder: (context, state) {
              return Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  children: [
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        TabWidget(
                          title: 'Revenue',
                          active: revenue,
                          value: true,
                          onPressed: changeTab,
                        ),
                        const SizedBox(width: 4),
                        TabWidget(
                          title: 'Expenses',
                          active: !revenue,
                          value: false,
                          onPressed: changeTab,
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    StatisticsCard(
                      chartData: ChartData(
                        sugar: 2.5,
                        cups: 2,
                        coffee: 2,
                        dessert: 2,
                        syrup: 2,
                      ),
                    ),
                    const SizedBox(height: 14),
                    if (state is RevenueLoadedState) ...[
                      if (getSorted(state.revenues).isEmpty)
                        const NoData()
                      else ...[
                        ...List.generate(
                          getSorted(state.revenues).length,
                          (index) {
                            return RevenueCard(
                              revenue: getSorted(state.revenues)[index],
                            );
                          },
                        ),
                      ],
                    ],
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
