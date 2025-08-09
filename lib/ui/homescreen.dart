import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news_bloc/news_bloc.dart';
import 'package:news_app/bloc/news_bloc/news_event.dart';
import 'package:news_app/bloc/news_bloc/news_state.dart';
import 'package:news_app/bloc/theme_bloc/theme_bloc.dart';
import 'package:news_app/bloc/theme_bloc/theme_event.dart';
import 'package:news_app/bloc/theme_bloc/theme_state.dart';
import 'package:news_app/ui/all_sources_news.dart';
import 'package:news_app/ui/category_wise_news.dart';
import 'package:news_app/ui/favourite_news.dart';
import 'package:news_app/ui/followed_news_source.dart';
import 'package:news_app/utils/enums.dart';
import 'package:news_app/utils/theme.dart';

class Homescreen extends StatefulWidget {
  final ThemeData currentThemData;
  const Homescreen({super.key, required this.currentThemData});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<NewsBloc>().add(FetchNews());
    _tabController = TabController(length: 8, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("News APP"),
        actions: [
          IconButton(
            onPressed: () {
              widget.currentThemData == lightThemeData
                  ? context.read<ThemeBloc>().add(ChangeToDarkTheme())
                  : context.read<ThemeBloc>().add(ChangeToLightTheme());
            },
            icon: Icon(
              widget.currentThemData == lightThemeData
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FollowedNewsSource()),
              );
            },
            icon: Icon(Icons.library_add_check),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return FavouriteNews();
                  },
                ),
              );
            },
            icon: Icon(Icons.favorite, color: Colors.red),
          ),
        ],
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController,
          tabs: [
            Tab(text: "All Sources News"),
            Tab(text: "business"),
            Tab(text: "entertainment"),
            Tab(text: "general"),
            Tab(text: "health"),
            Tab(text: "science"),
            Tab(text: "sports"),
            Tab(text: "technology"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          AllSourcesNews(),
          CategoryWiseNews(category: "business"),
          CategoryWiseNews(category: "entertainment"),
          CategoryWiseNews(category: "general"),
          CategoryWiseNews(category: "health"),
          CategoryWiseNews(category: "science"),
          CategoryWiseNews(category: "sports"),
          CategoryWiseNews(category: "technology"),
        ],
      ),
    );
  }
}
