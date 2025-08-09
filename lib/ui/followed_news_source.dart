import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/follow/follow_bloc.dart';
import 'package:news_app/bloc/follow/follow_event.dart';
import 'package:news_app/bloc/follow/follow_state.dart';

class FollowedNewsSource extends StatefulWidget {
  const FollowedNewsSource({super.key});

  @override
  State<FollowedNewsSource> createState() => _FollowedNewsSourceState();
}

class _FollowedNewsSourceState extends State<FollowedNewsSource> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Followed News Sources")),
      body: BlocBuilder<FollowBloc, FollowState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.followedNewsSource.length,
            itemBuilder: (context, index) {
              final followList = state.followedNewsSource[index];
              return ListTile(
                leading: CircleAvatar(child: Text("${index + 1}")),
                title: Text(followList),

                trailing: IconButton(
                  onPressed: () {
                    context.read<FollowBloc>().add(
                      UnFollowNewsSource(newsSource: followList),
                    );
                  },
                  icon: Icon(Icons.delete),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
