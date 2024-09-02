import 'package:cafe_test/features/revenue/bloc/revenue_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/chart_data.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/texts/text_e.dart';

class StatisticsCard extends StatefulWidget {
  const StatisticsCard({super.key, required this.chartData});

  final ChartData chartData;

  @override
  State<StatisticsCard> createState() => _StatisticsCardState();
}

class _StatisticsCardState extends State<StatisticsCard> {
  // Map<String, double> dataMap = {};

  @override
  void initState() {
    super.initState();
  }

  int byFourTypeFilter = 0;
  ValueNotifier<DateTime> filterByMonth = ValueNotifier(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          BlocBuilder<RevenueBloc, RevenueState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _Period(
                    title: 'Day',
                    active: byFourTypeFilter == 0,
                    onPressed: () {
                      byFourTypeFilter = 0;
                      context
                          .read<RevenueBloc>()
                          .add(GetFilterEvent(byFourType: 'Day'));
                      filterByMonth.value = DateTime.now();
                    },
                  ),
                  _Period(
                    title: 'Week',
                    active: byFourTypeFilter == 1,
                    onPressed: () {
                      byFourTypeFilter = 1;

                      context
                          .read<RevenueBloc>()
                          .add(GetFilterEvent(byFourType: 'Week'));
                      filterByMonth.value = DateTime.now();
                    },
                  ),
                  _Period(
                    title: 'Month',
                    active: byFourTypeFilter == 2,
                    onPressed: () {
                      byFourTypeFilter = 2;

                      context
                          .read<RevenueBloc>()
                          .add(GetFilterEvent(byFourType: 'Month'));
                      filterByMonth.value = DateTime.now();
                    },
                  ),
                  _Period(
                    title: 'Year',
                    active: byFourTypeFilter == 3,
                    onPressed: () {
                      byFourTypeFilter = 3;
                      context
                          .read<RevenueBloc>()
                          .add(GetFilterEvent(byFourType: 'Year'));
                      filterByMonth.value = DateTime.now();
                    },
                  ),
                ],
              );
            },
          ),
          // const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    filterByMonth.value = DateTime(filterByMonth.value.year,
                        filterByMonth.value.month - 1);
                    context
                        .read<RevenueBloc>()
                        .add(FilterByMonthEvent(dateTime: filterByMonth.value));
                  },
                  child: SvgPicture.asset('assets/arrow1.svg')),
              ValueListenableBuilder(
                valueListenable: filterByMonth,
                builder: (context, value, child) {
                  return TextE2(
                      DateFormat("MMMM yyyy").format(filterByMonth.value),
                      fontSize: 14);
                },
              ),
              CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    filterByMonth.value = DateTime(filterByMonth.value.year,
                        filterByMonth.value.month + 1);
                    context
                        .read<RevenueBloc>()
                        .add(FilterByMonthEvent(dateTime: filterByMonth.value));
                  },
                  child: SvgPicture.asset('assets/arrow2.svg')),
            ],
          ),
          const SizedBox(height: 24),
          BlocBuilder<RevenueBloc, RevenueState>(
            builder: (context, state) {
              int totalRevenue = 0;
              Map<String, double> dataMap = {};

              if (state is RevenueLoadedState) {
                dataMap = state.static;
                totalRevenue = state.totalRevenue;
              }
              print(dataMap);
              return PieChart(
                dataMap: dataMap,
                animationDuration: const Duration(milliseconds: 0),
                chartRadius: MediaQuery.of(context).size.width / 3.2,
                colorList: pieChartColors,
                initialAngleInDegree: 0,
                chartType: ChartType.ring,
                ringStrokeWidth: 9,
                centerText: totalRevenue != 0
                    ? '\$${totalRevenue - getTotalAmount()}'
                    : '\$$totalRevenue',
                centerTextStyle: const TextStyle(
                  color: AppColors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'InterE',
                ),
                legendOptions: const LegendOptions(showLegends: false),
                chartValuesOptions: const ChartValuesOptions(
                  showChartValueBackground: false,
                  showChartValues: false,
                  showChartValuesInPercentage: false,
                  showChartValuesOutside: false,
                  decimalPlaces: 0,
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          Container(
            height: 32,
            width: 130,
            decoration: BoxDecoration(
              color: AppColors.textField,
              borderRadius: BorderRadius.circular(16),
            ),
            child: CupertinoButton(
              onPressed: () {
                context.push('/revenue/add');
              },
              padding: EdgeInsets.zero,
              minSize: 32,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/add.svg'),
                  const SizedBox(width: 14),
                  const TextE2('Add New', fontSize: 14),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Period extends StatelessWidget {
  const _Period({
    required this.title,
    required this.active,
    required this.onPressed,
  });

  final String title;
  final bool active;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: active ? null : onPressed,
      child: TextE2(
        title,
        fontSize: 14,
        color: active ? AppColors.black : AppColors.grey1,
      ),
    );
  }
}
