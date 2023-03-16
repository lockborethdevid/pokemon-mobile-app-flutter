import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
part 'theme_state_state.dart';

class ThemeStateCubit extends Cubit<ThemeData> {

  ThemeStateCubit() : super(ThemeData.light());

  void changeTheme() {
    // action to change theme
    if (state == ThemeData.light()) {
      emit(ThemeData.dark());
      print("Switch to dark");
    } else {
      emit(ThemeData.light());
      print("Switch to light");
    }
  }
}
