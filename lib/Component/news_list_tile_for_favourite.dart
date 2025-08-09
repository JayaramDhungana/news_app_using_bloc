import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/favourite/favourite_bloc.dart';
import 'package:news_app/bloc/favourite/favourite_event.dart';

import 'package:news_app/utils/timeago.dart';

class NewsListTileForFavourite extends StatelessWidget {
  final ImageProvider<Object> image;
  final String title;
  final String sourceName;
  final String author;
  final String publishedAt;

  const NewsListTileForFavourite({
    super.key,
    required this.image,
    required this.title,
    required this.sourceName,
    required this.author,
    required this.publishedAt,
  });

  @override
  Widget build(BuildContext context) {
    DateTime publishedDate = DateTime.parse(publishedAt);
    // return BlocBuilder<FavouriteBloc, FavouriteState>(
    //   builder: (context, state) {
    //     bool isFavourite = state.favouriteNews.any(
    //       (news) => news.title == title,
    //     );
    return Card(
      elevation: 5,
      shadowColor: Colors.blue,
      child: ListTile(
        leading: SizedBox(
          height: 120,
          width: 90,
          child: Image(image: image, fit: BoxFit.fitHeight, width: 90),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(sourceName, style: TextStyle(fontWeight: FontWeight.w900)),
            Text(
              title,
              maxLines: 3,
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 90,
              child: Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                author,
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
            ),
            Spacer(),
            SizedBox(
              width: 90,
              child: Text(
                textAlign: TextAlign.end,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                formatTimeAgo(publishedDate),
              ),
            ),
          ],
        ),
        trailing: IconButton(
          onPressed: () {
            context.read<FavouriteBloc>().add(
              RemoveFromFavourite(title: title),
            );
          },
          icon: Icon(Icons.delete),
        ),
      ),
    );
  }
}
