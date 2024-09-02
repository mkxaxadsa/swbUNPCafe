import 'package:cafe_test/core/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/models/chart_data.dart';
import '../../../core/models/revenue.dart';

part 'revenue_event.dart';
part 'revenue_state.dart';

class RevenueBloc extends Bloc<RevenueEvent, RevenueState> {
  int totalPrice = 0;

  RevenueBloc() : super(RevenueInitial()) {
    on<GetRevenuesEvent>(_getRevenueEvent);

    on<AddRevenueEvent>(_addRevenueEvent);

    on<EditRevenueEvent>(_editRevenueEvent);

    on<DeleteRevenueEvent>(_deleteRevenueEvent);

    on<GetFilterEvent>(_filterEvent);
    on<FilterByMonthEvent>(_filterByMonthEvent);
  }

  _getRevenueEvent(GetRevenuesEvent event, emit) async {
    print(event);
    if (revenuesList.isEmpty) {
      await getRevenues();

      var chartsAndTotalRevenue = getChartsAndTotalRevenue(revenuesList);
      emit(RevenueLoadedState(
          revenues: revenuesList,
          totalRevenue: totalPrice,
          static: chartsAndTotalRevenue));
    } else {
      var chartsAndTotalRevenue = getChartsAndTotalRevenue(revenuesList);
      emit(RevenueLoadedState(
          revenues: revenuesList,
          totalRevenue: totalPrice,
          static: chartsAndTotalRevenue));
    }
  }

  _deleteRevenueEvent(DeleteRevenueEvent event, emit) async {
    revenuesList.removeWhere((element) => element.id == event.id);
    await updateRevenues();
    var chartsAndTotalRevenue = getChartsAndTotalRevenue(revenuesList);
    emit(RevenueLoadedState(
        revenues: revenuesList,
        static: chartsAndTotalRevenue,
        totalRevenue: totalPrice));
  }

  _editRevenueEvent(event, emit) async {
    for (Revenue revenue in revenuesList) {
      if (revenue.id == event.revenue.id) {
        revenue.price = event.revenue.price;
        revenue.category = event.revenue.category;
        revenue.date = event.revenue.date;
        revenue.revenue = event.revenue.revenue;
      }
    }
    await updateRevenues();
    var chartsAndTotalRevenue = getChartsAndTotalRevenue(revenuesList);
    emit(RevenueLoadedState(
        revenues: revenuesList,
        static: chartsAndTotalRevenue,
        totalRevenue: totalPrice));
  }

  _addRevenueEvent(AddRevenueEvent event, emit) async {
    revenuesList.add(event.revenue);
    await updateRevenues();
    var chartsAndTotalRevenue = getChartsAndTotalRevenue(revenuesList);
    emit(RevenueLoadedState(
        revenues: revenuesList,
        static: chartsAndTotalRevenue,
        totalRevenue: totalPrice));
  }

  _filterByMonthEvent(FilterByMonthEvent event, Emitter<RevenueState> emit) {
    List<Revenue> filters = revenuesList.toList();
    filters = filters.where((item) {
      var split = item.date.split(".");
      DateTime itemDate = DateTime(int.parse(split.last), int.parse(split[1]));
      return itemDate.month == event.dateTime.month &&
          itemDate.year == event.dateTime.year;
    }).toList();
    var chartsAndTotalRevenue = getChartsAndTotalRevenue(filters);
    emit(RevenueLoadedState(
        revenues: filters,
        static: chartsAndTotalRevenue,
        totalRevenue: totalPrice));
  }

  _filterEvent(GetFilterEvent event, Emitter<RevenueState> emit) {
    DateTime now = DateTime.now();
    List<Revenue> filters = revenuesList.toList();

    /// Filter By (Day, Week, Month, Year);
    switch (event.byFourType) {
      case 'Day':
        filters = filters.where((item) {
          var split = item.date.split(".");
          DateTime itemDate = DateTime(int.parse(split.last),
              int.parse(split[1]), int.parse(split.first));
          return itemDate.day == now.day &&
              itemDate.month == now.month &&
              itemDate.year == now.year;
        }).toList();
      case 'Week':
        DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
        DateTime endOfWeek = startOfWeek.add(Duration(days: 6));
        filters = filters.where((item) {
          var split = item.date.split(".");
          DateTime itemDate = DateTime(int.parse(split.last),
              int.parse(split[1]), int.parse(split.first));
          return itemDate.isAfter(startOfWeek.subtract(Duration(days: 1))) &&
              itemDate.isBefore(endOfWeek.add(Duration(days: 1)));
        }).toList();
      case 'Month':
        filters = filters.where((item) {
          var split = item.date.split(".");
          DateTime itemDate =
              DateTime(int.parse(split.last), int.parse(split[1]));
          return itemDate.month == now.month && itemDate.year == now.year;
        }).toList();
      case 'Year':
        filters = filters.where((item) {
          var split = item.date.split(".");
          DateTime itemDate = DateTime(int.parse(split.last));
          return itemDate.year == now.year;
        }).toList();
    }
    var chartsAndTotalRevenue = getChartsAndTotalRevenue(filters);
    print(chartsAndTotalRevenue);
    emit(RevenueLoadedState(
        revenues: filters,
        static: chartsAndTotalRevenue,
        totalRevenue: totalPrice));
  }

  Map<String, double> getChartsAndTotalRevenue(List<Revenue> filterList) {
    totalPrice = 0;
    ChartData chartData =
        ChartData(sugar: 0, cups: 0, coffee: 0, dessert: 0, syrup: 0);
    for (var element in filterList) {
      totalPrice += element.price;
      print(element.category);
      switch (element.category) {
        case 'Sugar':
          chartData.sugar += element.price;
          break;
        case 'Coffee Cups':
          chartData.cups += element.price;
          break;
        case 'Coffee':
          chartData.coffee += element.price;
          break;
        case 'Desserts':
          print("add");
          chartData.dessert += element.price;
          break;
        case 'Syrup for Coffee':
          chartData.syrup += element.price;
          break;
      }
    }

    return {
      "Sugar": chartData.sugar,
      "Coffee Cups": chartData.cups,
      "Coffee": chartData.coffee,
      "Dessert": chartData.dessert,
      "Syrup for Coffee": chartData.syrup
    };
  }
}
