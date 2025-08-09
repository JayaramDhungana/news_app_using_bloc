import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/bloc/favourite/favourite_bloc.dart';
import 'package:news_app/bloc/favourite/favourite_event.dart';
import 'package:news_app/bloc/favourite/favourite_state.dart';
import 'package:news_app/bloc/follow/follow_bloc.dart';
import 'package:news_app/bloc/follow/follow_event.dart';
import 'package:news_app/bloc/follow/follow_state.dart';
import 'package:news_app/ui/news_detail_screen.dart';
import 'package:news_app/utils/timeago.dart';

class NewsListTile extends StatelessWidget {
  final ImageProvider<Object> image;
  final String title;
  final String sourceName;
  final String author;
  final String publishedAt;
  final String imageUrl;
  final String description;
  final String content;
  final String url;

  const NewsListTile({
    super.key,
    required this.image,
    required this.title,
    required this.sourceName,
    required this.author,
    required this.publishedAt,
    required this.imageUrl,
    required this.description,
    required this.content,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    DateTime publishedDate = DateTime.parse(publishedAt);
    return BlocBuilder<FavouriteBloc, FavouriteState>(
      builder: (context, state) {
        bool isFavourite = state.favouriteNews.any(
          (news) => news.title == title,
        );
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewsDetailScreen(
                  title: title,
                  sourceName: sourceName,
                  author: author,
                  publishedAt: publishedAt,
                  imageUrl: imageUrl,
                  content: content,
                  description: description,
                  url: url,
                ),
              ),
            );
          },
          child: Card(
            elevation: 5,
            shadowColor: Colors.blue,
            child: ListTile(
              leading: SizedBox(
                height: size.height * 0.2,
                width: size.width * 0.2,
                child: Image(image: image, fit: BoxFit.fitHeight),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.3,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          sourceName,
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                      ),
                      Spacer(),
                      BlocBuilder<FollowBloc, FollowState>(
                        builder: (context, state) {
                          bool isFollowed = state.followedNewsSource.contains(
                            sourceName,
                          );
                          return InkWell(
                            onTap: () {
                              isFollowed
                                  ? context.read<FollowBloc>().add(
                                      UnFollowNewsSource(
                                        newsSource: sourceName,
                                      ),
                                    )
                                  : context.read<FollowBloc>().add(
                                      FollowNewsSource(newsSource: sourceName),
                                    );
                            },
                            child: Text(
                              isFollowed ? "Following" : "Follow",
                              style: TextStyle(
                                color: Colors.blue,

                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
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
                    width: size.width * 0.25,
                    child: Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      author,
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: size.width * 0.2,
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
                icon: Icon(
                  isFavourite ? Icons.favorite : Icons.favorite_border,
                  color: isFavourite ? Colors.red : null,
                ),
                onPressed: () {
                  isFavourite
                      ? context.read<FavouriteBloc>().add(
                          RemoveFromFavourite(title: title),
                        )
                      : context.read<FavouriteBloc>().add(
                          AddToFavourite(
                            image: imageUrl,
                            sourceName: sourceName,
                            author: author,
                            publishedAt: publishedAt,
                            title: title,
                          ),
                        );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
