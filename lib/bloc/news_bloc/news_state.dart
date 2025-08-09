import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/utils/enums.dart';

// abstract class NewsState extends Equatable {}

// class AllNewsState extends NewsState {
//   final List<NewsModel> newsList;

//   AllNewsState({this.newsList = const []});

//   // AllNewsState copyWith(List<NewsModel>? newsList) {
//   //   return AllNewsState(
//   //     newsList:
//   //   );
//   // }

//   @override
//   // TODO: implement props
//   List<Object?> get props => [];
// }

class NewsState extends Equatable {
  final List<NewsModel> newsList;
  final List<NewsModel> categoryWiseNewsList;
  final NewsStatus newsStatus;

  const NewsState({
    this.newsList = const [],
    this.newsStatus = NewsStatus.loading,
    this.categoryWiseNewsList = const [],
  });

  NewsState copyWith({
    List<NewsModel>? newsList,
    NewsStatus? newsStatus,
    List<NewsModel>? categoryWiseNewsList,
  }) {
    return NewsState(
      newsList: newsList ?? this.newsList,
      newsStatus: newsStatus ?? this.newsStatus,
      categoryWiseNewsList: categoryWiseNewsList ?? this.categoryWiseNewsList,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [newsList, categoryWiseNewsList];
}
