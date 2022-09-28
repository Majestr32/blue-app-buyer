part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final ThemeMode theme;

  factory ThemeState.initial(){
    return ThemeState(theme: ThemeMode.light);
  }
  const ThemeState({
    required this.theme,
  });

  ThemeState copyWith({
    ThemeMode? theme,
  }) {
    return ThemeState(
      theme: theme ?? this.theme,
    );
  }

  @override
  List<Object> get props => [theme];
}
