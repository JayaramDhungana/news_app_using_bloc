import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/a_bloc/news_bloc.dart';
import 'package:news_app/bloc/news_bloc/news_bloc.dart';
import 'package:news_app/bloc/favourite/favourite_bloc.dart';
import 'package:news_app/bloc/follow/follow_bloc.dart';
import 'package:news_app/bloc/theme_bloc/theme_bloc.dart';
import 'package:news_app/bloc/theme_bloc/theme_state.dart';
import 'package:news_app/ui/homescreen.dart';
import 'package:news_app/utils/theme.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

void main() {
  WebViewPlatform.instance;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NewsBloc()),
        BlocProvider(create: (_) => NewsBlocA()),
        BlocProvider(create: (_) => FavouriteBloc()),
        BlocProvider(create: (_) => FollowBloc()),
        BlocProvider(create: (_) => ThemeBloc()),
      ],

      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: state.themeData,
            home:Homescreen(currentThemData: state.themeData)
          );
        },
      ),
    );
  }
}
