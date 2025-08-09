import 'package:equatable/equatable.dart';

abstract class ThemeEvent extends Equatable {}

class ChangeToLightTheme extends ThemeEvent {
  @override
  
  List<Object?> get props => [];
}

class ChangeToDarkTheme extends ThemeEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
