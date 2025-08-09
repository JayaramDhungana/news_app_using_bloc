import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/favourite/favourite_event.dart';
import 'package:news_app/bloc/favourite/favourite_state.dart';
import 'package:news_app/model/news_model.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteBloc() : super(InitialState()) {
    on<AddToFavourite>(_addToFavourite);
    on<RemoveFromFavourite>(_removeFromFavourite);
  }

  void _addToFavourite(AddToFavourite event, Emitter<FavouriteState> emit) {
    final List<NewsModel> currentLikedNews = List.from(state.favouriteNews);
 
      currentLikedNews.add(NewsModel(author: event.author, title: event.title,  urlToImage: event.image.toString(), publishedAt: event.publishedAt, sourceName: event.sourceName, description: '', url: '', content: ''));

    emit(NewsLikedState(favouriteNews: currentLikedNews));
  }

  void _removeFromFavourite(
    RemoveFromFavourite event,
    Emitter<FavouriteState> emit,
  ) {
    final List<NewsModel> currentLikedNews = List.from(state.favouriteNews);
      currentLikedNews.removeWhere((news) => news.title == event.title);
      emit(NewsUnlikedState(favouriteNews: currentLikedNews));
    }
}
