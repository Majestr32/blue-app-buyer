part of 'tag_cubit.dart';

enum TagStateStatus {
  initial,
  loaded
}

class TagState extends Equatable {
  final List<Tag> tags;
  final List<Tag> activeTags;
  final TagStateStatus status;

  factory TagState.initial(){
    return TagState(tags: [], activeTags: [], status: TagStateStatus.initial);
  }

  const TagState({
    required this.tags,
    required this.activeTags,
    required this.status,
  });

  TagState copyWith({
    List<Tag>? tags,
    List<Tag>? activeTags,
    TagStateStatus? status,
  }) {
    return TagState(
      tags: tags ?? this.tags,
      activeTags: activeTags ?? this.activeTags,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [tags, activeTags, status];
}
