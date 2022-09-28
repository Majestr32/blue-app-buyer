import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.initial());

  void toggleTheme(){
    emit(state.copyWith(theme: state.theme == ThemeMode.light ? ThemeMode.dark : ThemeMode.light));
  }
}
