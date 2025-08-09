import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Component/news_list_tile_for_favourite.dart';
import 'package:news_app/bloc/favourite/favourite_bloc.dart';
import 'package:news_app/bloc/favourite/favourite_state.dart';

class FavouriteNews extends StatefulWidget {
  const FavouriteNews({super.key});

  @override
  State<FavouriteNews> createState() => _FavouriteNewsState();
}

class _FavouriteNewsState extends State<FavouriteNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Favourite News")),

      body: BlocBuilder<FavouriteBloc, FavouriteState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.favouriteNews.length,
            itemBuilder: (context, index) {
              final favouriteNewsToShow = state.favouriteNews[index];
              return NewsListTileForFavourite(
                image: favouriteNewsToShow.urlToImage != 'No Image'
                        ? NetworkImage(favouriteNewsToShow.urlToImage)
                        : AssetImage("assets/image.png"),
                title: favouriteNewsToShow.title,
                sourceName: favouriteNewsToShow.sourceName,
                author: favouriteNewsToShow.author,
                publishedAt: favouriteNewsToShow.publishedAt,
              );
            },
          );
        },
      ),
    );
  }
}
