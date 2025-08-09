import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Component/news_list_tile.dart';
import 'package:news_app/bloc/a_bloc/news_bloc.dart';
import 'package:news_app/bloc/a_bloc/news_event.dart';
import 'package:news_app/bloc/a_bloc/news_states.dart';

import 'package:news_app/utils/enums.dart';

class CategoryWiseNews extends StatefulWidget {
  final String category;
  const CategoryWiseNews({super.key, required this.category});

  @override
  State<CategoryWiseNews> createState() => _CategoryWiseNewsState();
}

class _CategoryWiseNewsState extends State<CategoryWiseNews> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<NewsBlocA>().add(FetchCategoryWiseNews(widget.category));
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
            } else if (state is CategoryWiseFetchSuccess) {
              return ListView.builder(
                itemCount: state.categoryWiseNews.length,
                itemBuilder: (context, index) {
                  final newsToShow = state.categoryWiseNews[index];
                  return NewsListTile(
                    image: newsToShow.urlToImage != 'No Image'
                        ? NetworkImage(newsToShow.urlToImage)
                        : AssetImage("assets/image.png"),
                    title: newsToShow.title,
                    author: newsToShow.author,
                    sourceName: newsToShow.sourceName,
                    publishedAt: newsToShow.publishedAt,
                    imageUrl: newsToShow.urlToImage,
                    content: newsToShow.content,
                    description: newsToShow.description,
                    url: newsToShow.url,
                  );
                },
              );
            } else {
              return Text("That is error");
            }
          },
        ),
      ),
    );

    // Scaffold(
    //   body: BlocBuilder<NewsBloc, NewsState>(
    //     builder: (context, state) {
    //       if(state is NewsState){

    //       }
    //       log(state.categoryWiseNewsList.length.toString());
    //       return ListView.builder(
    //         itemCount: state.categoryWiseNewsList.length,

    //         itemBuilder: (context, index) {
    //           final newsToShow = state.categoryWiseNewsList[index];

    //           switch (state.newsStatus) {
    //             case NewsStatus.loading:
    //               return Center(child: CircularProgressIndicator());
    //             case NewsStatus.failure:
    //               return Center(child: Text("Failed to Load Data"));
    //             case NewsStatus.success:
    // return NewsListTile(
    //   image:
    // newsToShow.urlToImage != 'No Image'
    //       ? NetworkImage(newsToShow.urlToImage)
    //       : AssetImage("assets/image.png"),
    //   title: newsToShow.title,
    // );
    //           }
    //         },
    //       );
    //     },
    //   ),
    // );
  }
}
