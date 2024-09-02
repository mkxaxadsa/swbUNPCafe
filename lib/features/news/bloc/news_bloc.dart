import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/models/news.dart';
import '../../../core/utils.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial()) {
    on<GetNewsEvent>((event, emit) async {
      if (newsList.isEmpty) {
        await getNews();
        emit(NewsLoadedState(news: newsList));
      } else {
        emit(NewsLoadedState(news: newsList));
      }
    });

    on<AddNewsEvent>((event, emit) async {
      newsList.add(event.news);
      await updateNews();
      emit(NewsLoadedState(news: newsList));
    });

    on<EditNewsEvent>((event, emit) async {
      for (News news in newsList) {
        if (news.id == event.news.id) {
          news.title = event.news.title;
          news.body = event.news.body;
          news.image = event.news.image;
          news.image2 = event.news.image2;
          news.image3 = event.news.image3;
          news.image4 = event.news.image4;
        }
      }
      await updateNews();
      emit(NewsLoadedState(news: newsList));
    });

    on<DeleteNewsEvent>((event, emit) async {
      newsList.removeWhere((element) => element.id == event.id);
      await updateNews();
      emit(NewsLoadedState(news: newsList));
    });
  }
}
