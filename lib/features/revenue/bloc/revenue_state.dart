part of 'revenue_bloc.dart';

abstract class RevenueState {}

class RevenueInitial extends RevenueState {}

class RevenueLoadedState extends RevenueState {
  final List<Revenue> revenues;
  final Map<String, double> static;
  final int totalRevenue;

  RevenueLoadedState(
      {required this.revenues,
      required this.static,
      required this.totalRevenue});
}
