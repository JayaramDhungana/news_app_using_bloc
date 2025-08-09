import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news_bloc/news_event.dart';
import 'package:news_app/bloc/news_bloc/news_state.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/repository/category_wise_repository.dart';
import 'package:news_app/repository/news_repository.dart';
import 'package:news_app/utils/enums.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsRepository newsRepository = NewsRepository();

  NewsBloc() : super(NewsState()) {
    on<FetchNews>(_fetchNews);
    on<FetchCategoryWiseNews>(_fetchCategoryWiseNews);
  }
  Future<void> _fetchNews(FetchNews event, Emitter<NewsState> emit) async {
    try {
      final List<NewsModel> newsList = await newsRepository.fetchNews();
      emit(state.copyWith(newsList: newsList, newsStatus: NewsStatus.success));
    } catch (e) {
      emit(state.copyWith(newsStatus: NewsStatus.failure));
      log("The Error is $e");
    }
  }

  Future<void> _fetchCategoryWiseNews(
    FetchCategoryWiseNews event,
    Emitter<NewsState> emit,
  ) async {
    CategoryWiseRepository categoryWiseRepository = CategoryWiseRepository(
      category: event.category,
    );
    try {
      final List<NewsModel> categoryWiseNewsList = await categoryWiseRepository
          .fetchCategoryWiseNews();
      emit(
        state.copyWith(
          categoryWiseNewsList: categoryWiseNewsList,
          newsStatus: NewsStatus.success,
        ),
      );
      log(
        "categoryWise News in Bloc ${categoryWiseNewsList.length.toString()}",
      );
    } catch (e) {
      emit(state.copyWith(newsStatus: NewsStatus.failure));
      log("The Error is $e");
    }
  }
}
