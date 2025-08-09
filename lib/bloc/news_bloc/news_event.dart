import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchNews extends NewsEvent {}

class FetchCategoryWiseNews extends NewsEvent {
  final   String category;
  FetchCategoryWiseNews(this.category);

  @override
  List<Object?> get props => [category];
}
