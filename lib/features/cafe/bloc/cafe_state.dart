part of 'cafe_bloc.dart';

abstract class CafeState {}

class CafeInitial extends CafeState {}

class CafeLoadedState extends CafeState {
  final List<Cafe> cafes;
  CafeLoadedState({required this.cafes});
}
