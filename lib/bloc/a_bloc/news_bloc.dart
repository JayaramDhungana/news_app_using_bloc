import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/a_bloc/news_event.dart';
import 'package:news_app/bloc/a_bloc/news_states.dart';

import 'package:news_app/model/news_model.dart';
import 'package:news_app/repository/category_wise_repository.dart';
import 'package:news_app/repository/news_repository.dart';

class NewsBlocA extends Bloc<NewsEvent, NewsStates> {
  NewsRepository newsRepository = NewsRepository();
  List<String> favouriteNews = [];
  NewsBlocA() : super(InitialState()) {
    on<FetchNews>(_fetchAllNews);
    on<FetchCategoryWiseNews>(_fetchCategoryWiseNews);
    on<AddToFavouriteNews>(_addToFavouriteNews);
    on<FetchFavouriteNews>((event, emit) {
  emit(AddToFavourite(favouriteNews: List.from(favouriteNews)));
});
  }

  Future<void> _fetchAllNews(FetchNews event, Emitter<NewsStates> emit) async {
    emit(InitialState());
    try {
      final List<NewsModel> newsList = await newsRepository.fetchNews();
      emit(AllNewsFetchSuccess(newsList: newsList));
    } catch (e) {
      emit(ErrorState(errorMessage: "The error message is $e"));
    }
  }

  Future<void> _fetchCategoryWiseNews(
    FetchCategoryWiseNews event,
    Emitter<NewsStates> emit,
  ) async {
    CategoryWiseRepository categoryWiseRepository = CategoryWiseRepository(
      category: event.category,
    );
    emit(InitialState());
    try {
      final List<NewsModel> categoryWiseNewsList = await categoryWiseRepository
          .fetchCategoryWiseNews();
      emit(CategoryWiseFetchSuccess(categoryWiseNews: categoryWiseNewsList));
    } catch (e) {
      emit(ErrorState(errorMessage: "The error message is $e"));
    }
  }

  //Add to Favourite
  void _addToFavouriteNews(AddToFavouriteNews event, Emitter<NewsStates> emit) {
    favouriteNews.add(event.title);
  emit(AddToFavourite(favouriteNews: List.from(favouriteNews)));
  }
}
