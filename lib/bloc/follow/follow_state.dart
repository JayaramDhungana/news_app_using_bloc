import 'package:equatable/equatable.dart';

abstract class FollowState extends Equatable {
  final List<String> followedNewsSource;

  const FollowState({required this.followedNewsSource});
}

class InitialState extends FollowState {
  InitialState() : super(followedNewsSource: []);
  @override
  List<Object?> get props => [followedNewsSource];
}

class FollowNewsSourceState extends FollowState {
  const FollowNewsSourceState({required super.followedNewsSource});
  @override
  List<Object?> get props => [followedNewsSource];
}

class UnFollowNewsSourceState extends FollowState {
  const UnFollowNewsSourceState({required super.followedNewsSource});
  @override
  List<Object?> get props => [followedNewsSource];
}
