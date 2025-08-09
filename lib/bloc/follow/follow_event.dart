import 'package:equatable/equatable.dart';

abstract class FollowEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FollowNewsSource extends FollowEvent {
  final String newsSource;
  FollowNewsSource({required this.newsSource});
  List<Object?> get props => [newsSource];
}

class UnFollowNewsSource extends FollowEvent {
  final String newsSource;
  UnFollowNewsSource({required this.newsSource});
   List<Object?> get props => [newsSource];
}
