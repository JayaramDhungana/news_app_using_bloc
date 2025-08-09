import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/follow/follow_event.dart';
import 'package:news_app/bloc/follow/follow_state.dart';

class FollowBloc extends Bloc<FollowEvent, FollowState> {
  FollowBloc() : super(InitialState()) {
    on<FollowNewsSource>(_followNewsSource);
    on<UnFollowNewsSource>(_unFollowNewsSource);
  }

  void _followNewsSource(FollowNewsSource event, Emitter<FollowState> emit) {
    List<String> currentFollowList = List.from(state.followedNewsSource);
    currentFollowList.add(event.newsSource);
    emit(FollowNewsSourceState(followedNewsSource: currentFollowList));
  }

  void _unFollowNewsSource(
    UnFollowNewsSource event,
    Emitter<FollowState> emit,
  ) {
    List<String> currentFollowList = List.from(state.followedNewsSource);
    currentFollowList.remove(event.newsSource);
    emit(FollowNewsSourceState(followedNewsSource: currentFollowList));
  }
}
