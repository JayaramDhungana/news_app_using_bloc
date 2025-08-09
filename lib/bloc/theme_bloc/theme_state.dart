import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:news_app/utils/theme.dart';

abstract class ThemeState extends Equatable {
  final ThemeData themeData;
  ThemeState({required this.themeData});
}

class InitialThemeState extends ThemeState {
  InitialThemeState() : super(themeData: lightThemeData);

  @override
  // TODO: implement props
  List<Object?> get props => [themeData];
}

class LightThemeState extends ThemeState {
  LightThemeState({required super.themeData});
  @override
  // TODO: implement props
  List<Object?> get props => [themeData];
}

class DarkThemeState extends ThemeState {
  DarkThemeState({required super.themeData});

  @override
  // TODO: implement props
  List<Object?> get props => [themeData];
}
