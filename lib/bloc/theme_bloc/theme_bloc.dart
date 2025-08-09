import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/theme_bloc/theme_event.dart';
import 'package:news_app/bloc/theme_bloc/theme_state.dart';
import 'package:news_app/utils/theme.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(InitialThemeState()) {
    on<ChangeToLightTheme>(_changeToLightTheme);
    on<ChangeToDarkTheme>(_changeToDarkTheme);
  }

  void _changeToLightTheme(ChangeToLightTheme event, Emitter<ThemeState> emit) {
    emit(LightThemeState(themeData: lightThemeData));
  }

  void _changeToDarkTheme(ChangeToDarkTheme event, Emitter<ThemeState> emit) {
    emit(DarkThemeState(themeData: darkThemeData));
  }
}
