part of 'revenue_bloc.dart';

abstract class RevenueEvent {}

class GetRevenuesEvent extends RevenueEvent {}

class GetFilterEvent extends RevenueEvent {
  String? byFourType; // Day, Week, Month, Year

  GetFilterEvent({this.byFourType});
}

class FilterByMonthEvent extends RevenueEvent {
  DateTime dateTime; // Filter by month

  FilterByMonthEvent({required this.dateTime});
}

class AddRevenueEvent extends RevenueEvent {
  final Revenue revenue;

  AddRevenueEvent({required this.revenue});
}

class EditRevenueEvent extends RevenueEvent {
  final Revenue revenue;

  EditRevenueEvent({required this.revenue});
}

class DeleteRevenueEvent extends RevenueEvent {
  final int id;

  DeleteRevenueEvent({required this.id});
}
