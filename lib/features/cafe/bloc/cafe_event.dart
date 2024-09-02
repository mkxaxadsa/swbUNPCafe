part of 'cafe_bloc.dart';

abstract class CafeEvent {}

class GetCafesEvent extends CafeEvent {}

class AddCafeEvent extends CafeEvent {
  final Cafe cafe;
  AddCafeEvent({required this.cafe});
}

class EditCafeEvent extends CafeEvent {
  final Cafe cafe;
  EditCafeEvent({required this.cafe});
}

class DeleteCafeEvent extends CafeEvent {
  final int id;
  DeleteCafeEvent({required this.id});
}
