part of 'tag_cubit.dart';

enum FavStateStatus {
  initial,
  loaded
}

class TagState extends Equatable {
  final List<Tag> tags;
  final FavStateStatus status;

  factory TagState.initial(){
    return TagState(tags: [], status: FavStateStatus.initial);
  }

  const TagState({
    required this.tags,
    required this.status,
  });

  TagState copyWith({
    List<Tag>? tags,
    FavStateStatus? status,
  }) {
    return TagState(
      tags: tags ?? this.tags,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [tags, status];
}
