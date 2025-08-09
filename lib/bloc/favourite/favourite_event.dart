import 'package:equatable/equatable.dart';

class FavouriteEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AddToFavourite extends FavouriteEvent {
  final String image;
  final String title;
  final String sourceName;
  final String author;
  final String publishedAt;
  AddToFavourite({
    required this.image,
    required this.sourceName,
    required this.author,
    required this.publishedAt,
    required this.title,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [title, image, sourceName, author, publishedAt];
}

class RemoveFromFavourite extends FavouriteEvent {
  final String title;
  RemoveFromFavourite({required this.title});

  @override
  // TODO: implement props
  List<Object?> get props => [title];
}
