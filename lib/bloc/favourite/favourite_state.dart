import 'package:equatable/equatable.dart';
import 'package:news_app/model/news_model.dart';

abstract class FavouriteState extends Equatable {
  final List<NewsModel> favouriteNews;

  const FavouriteState({required this.favouriteNews});
}

class InitialState extends FavouriteState {
  InitialState() : super(favouriteNews: []);

  @override
  // TODO: implement props
  List<Object?> get props => [favouriteNews];
}

class NewsLikedState extends FavouriteState {
  const NewsLikedState({required super.favouriteNews});

  @override
  // TODO: implement props
  List<Object?> get props => [favouriteNews];
}

class NewsUnlikedState extends FavouriteState {
  const NewsUnlikedState({required super.favouriteNews});

  @override
  // TODO: implement props
  List<Object?> get props => [favouriteNews];
}
