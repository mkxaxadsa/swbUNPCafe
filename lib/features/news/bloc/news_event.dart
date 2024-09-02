part of 'news_bloc.dart';

abstract class NewsEvent {}

class GetNewsEvent extends NewsEvent {}

class AddNewsEvent extends NewsEvent {
  final News news;
  AddNewsEvent({required this.news});
}

class EditNewsEvent extends NewsEvent {
  final News news;
  EditNewsEvent({required this.news});
}

class DeleteNewsEvent extends NewsEvent {
  final int id;
  DeleteNewsEvent({required this.id});
}
