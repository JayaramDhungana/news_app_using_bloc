import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Component/news_list_tile.dart';
import 'package:news_app/bloc/a_bloc/news_bloc.dart';
import 'package:news_app/bloc/a_bloc/news_event.dart';
import 'package:news_app/bloc/a_bloc/news_states.dart';

class AllSourcesNews extends StatefulWidget {
  const AllSourcesNews({super.key});

  @override
  State<AllSourcesNews> createState() => _AllSourcesNewsState();
}

class _AllSourcesNewsState extends State<AllSourcesNews> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<NewsBlocA>().add(FetchNews());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<NewsBlocA, NewsStates>(
        listener: (context, state) {
          if (state is ErrorState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("Error ")));
          }
        },
        child: BlocBuilder<NewsBlocA, NewsStates>(
          builder: (context, state) {
            if (state is InitialState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is AllNewsFetchSuccess) {
              return ListView.builder(
                itemCount: state.newsList.length,
                itemBuilder: (context, index) {
                  final newsToShow = state.newsList[index];
                  return NewsListTile(
                    image: newsToShow.urlToImage != 'No Image'
                        ? NetworkImage(newsToShow.urlToImage)
                        : AssetImage("assets/image.png"),
                    title: newsToShow.title,
                    sourceName: newsToShow.sourceName,
                    author: newsToShow.author,
                    publishedAt: newsToShow.publishedAt,
                    imageUrl: newsToShow.urlToImage,
                    content: newsToShow.content,
                    description: newsToShow.description,
                    url: newsToShow.url,
                  );
                },
              );
            } else if (state is ErrorState) {
              return Center(child: Text(state.errorMessage));
            } else {
              return Text("The Error Occured");
            }
          },
        ),
      ),

      // BlocBuilder<NewsBloc, NewsState>(
      //   builder: (context, state) {
      //     switch (state.newsStatus) {
      //       case NewsStatus.loading:
      //         return Center(child: CircularProgressIndicator());
      //       case NewsStatus.success:
      //         return ListView.builder(
      //           itemCount: state.newsList.length,
      //           itemBuilder: (context, index) {
      //             final newsToShow = state.newsList[index];
      //             return NewsListTile(
      //               image: newsToShow.urlToImage != 'No Image'
      //                   ? NetworkImage(newsToShow.urlToImage)
      //                   : AssetImage("assets/image.png"),
      //               title: newsToShow.title,
      //             );
      //           },
      //         );

      //       case NewsStatus.failure:
      //         return Text("Failed to Load Data");
      //     }
      //   },
      // ),
    );
  }
}
