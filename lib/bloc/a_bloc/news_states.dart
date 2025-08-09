import 'package:equatable/equatable.dart';
import 'package:news_app/model/news_model.dart';

abstract class NewsStates extends Equatable {}

class InitialState extends NewsStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ErrorState extends NewsStates {
  final String errorMessage;

  ErrorState({required this.errorMessage});
  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
}

class AllNewsFetchSuccess extends NewsStates {
  final List<NewsModel> newsList;

  AllNewsFetchSuccess({required this.newsList});

  @override
  // TODO: implement props
  List<Object?> get props => [newsList];
}

class CategoryWiseFetchSuccess extends NewsStates {
  final List<NewsModel> categoryWiseNews;

  CategoryWiseFetchSuccess({required this.categoryWiseNews});

  @override
  // TODO: implement props
  List<Object?> get props => [categoryWiseNews];
}

class AddToFavourite extends NewsStates {
  final List<String> favouriteNews;

  AddToFavourite({required this.favouriteNews});

    @override
  // TODO: implement props
  List<Object?> get props => [favouriteNews];
}
