part of 'theme_state_cubit.dart';

abstract class ThemeStateState extends Equatable {
  const ThemeStateState();

  @override
  List<Object> get props => [];
}

class ThemeStateInitial extends ThemeStateState {
  ThemeStateInitial(this.themeStatus);
  final ThemeData themeStatus;
}
